FROM mongo:latest

COPY resume.json /resume.json
CMD mongoimport --uri "mongodb://root:secret@mongo:27017/resumes?authSource=admin" --collection resumes --type json --file /resume.json --jsonArray