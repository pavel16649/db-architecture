import os
import psycopg2
import time
import re

# Connect to the PostgreSQL database
conn = psycopg2.connect(
    host=os.getenv("DB_HOST"),
    port=os.getenv("DB_PORT"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    dbname=os.getenv("DB_NAME")
)

# Set the number of times to run each query (from the environment variable)
num_trials = int(os.getenv("NUM_TRIALS"))

# Set the path to the directory containing the SQL query files
query_dir = os.getenv("QUERY_DIR")
output_dir = os.environ.get('OUTPUT_DIR', '/service/explain_analyze_out')

# Set the output file name
output_file = f"query_results_{time.strftime('%Y%m%d_%H%M%S')}.txt"
output_path = os.path.join(output_dir, output_file)

# Open the output file for writing
with open(output_path, "w") as f:

    # Loop over each SQL query file in the directory
    for filename in os.listdir(query_dir):
        if filename.endswith(".sql"):

            # Print the name of the query to the output file
            f.write(f"Query: {filename}\n")

            # Set the minimum, maximum, and average costs to None
            min_cost = None
            max_cost = None
            avg_cost = None

            # Loop over the specified number of trials
            for i in range(num_trials):

                # Print the trial number to the output file
                f.write(f"Trial {i + 1}: ")

                # Read the SQL query from the file
                with open(os.path.join(query_dir, filename), "r") as query_file:
                    query = query_file.read()

                # Execute the EXPLAIN ANALYZE command for the query
                with conn.cursor() as cur:
                    cur.execute(f"EXPLAIN ANALYZE {query}")
                    result = cur.fetchone()

                # Extract the cost from the EXPLAIN ANALYZE result
                cost_match = re.search(r'cost=(\d+\.\d+)\.\.(\d+\.\d+)', result[0])
                cost = float(cost_match.group(2))

                # Print the cost to the output file
                f.write(f"{cost:.2f}\n")

                # Update the minimum, maximum, and average costs
                if min_cost is None or cost < min_cost:
                    min_cost = cost
                if max_cost is None or cost > max_cost:
                    max_cost = cost
                avg_cost = (avg_cost * i + cost) / (i + 1) if avg_cost is not None else cost

            # Print the minimum, maximum, and average costs to the output file
            f.write(f"Minimum cost: {min_cost:.2f}\n")
            f.write(f"Maximum cost: {max_cost:.2f}\n")
            f.write(f"Average cost: {avg_cost:.2f}\n\n")

# Close the database connection
conn.close()
