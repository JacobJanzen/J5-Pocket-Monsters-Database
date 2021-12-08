from flask import jsonify


def sqlite_to_json(query_output):
    out = []
    for row in query_output:
        mapped_row = {}
        for idx in range(len(row)):
            mapped_row[row.keys()[idx]] = row[idx]
        out.append(mapped_row)

    return jsonify(out)
