from flask import jsonify
import csv


def sqlite_to_json(query_output):
    out = []
    for row in query_output:
        mapped_row = {}
        for idx in range(len(row)):
            mapped_row[row.keys()[idx]] = row[idx]
        out.append(mapped_row)

    write_to_csv(out)
    return jsonify(out)


def write_to_csv(query_output):
    with open('query_output.csv', 'w', newline='') as csvfile:
        writer = csv.writer(csvfile, dialect='excel') 
        writer.writerow(query_output[0]) # column names

        for row in query_output:
            writer.writerow(row.values())
