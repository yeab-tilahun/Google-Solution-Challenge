from flask import Flask, request 
from langchain import OpenAI
import os
import configparser
from langchain.document_loaders import PyPDFLoader
from langchain.embeddings.openai import OpenAIEmbeddings
from langchain.vectorstores import Chroma
from langchain.chains import RetrievalQAWithSourcesChain 
import ai

app = Flask(__name__)

# config = configparser.ConfigParser()
# config.read('config.ini')
# os.environ["OPENAI_API_KEY"] = config.get('API','OPEN_AI')
# path = "modules"
# pdfs = [f for f in os.listdir(path) if f.endswith('.pdf')]
# loaders = [PyPDFLoader(f"{path}/{pdf}") for pdf in pdfs]
# docs = [doc for loader in loaders for doc in loader.load_and_split()]

# embeddings = OpenAIEmbeddings()
# docsearch = Chroma.from_documents(docs, embeddings)

# chain = RetrievalQAWithSourcesChain.from_chain_type(OpenAI(temperature=0), chain_type="stuff", retriever=docsearch.as_retriever())
# app.config['chain'] = chain

@app.route('/question', methods=['POST'])
def answer():
    if app.config.get('answer') is None:
        app.config['answer'] = ai.AI()
        # get the question from json
    data = request.get_json()
    question = data['question']

    # return the answer
    return app.config['answer'].answer(question)


# @app.route('/upload', methods=['POST'])
# def upload():
#     # if the uploaded file is pdf
#     if request.files['file'].filename.endswith('.pdf'):
#         # save the file
#         file = request.files['file']
#         file.save('file.pdf')
#         # create a loader for the pdf
#         loader = PyPDFLoader('file.pdf')
#         # create a new index
#         index = VectorstoreIndexCreator().from_loaders([loader])
#         # set the index as the answer
#         app.config['answer'] = index
#         return 'File uploaded'
#     elif request.files['file'].filename.endswith('.docx'):

#     else:


# @app.route('/answer', methods=['POST', 'GET'])
# def answer():
#     if request == 'GET':
#         question = request.args.get('question')
#         if index == None:
#             return '<h1> No context to answer from!</h1>'
#         return index.query(question)
#     else:
#         file = request.files['file']
#         question = request.form['question']
#         file.save('file.pdf')
#         loader = PyPDFLoader('file.pdf')
#         index = VectorstoreIndexCreator().from_loaders([loader])
#         return {'question': question, 'answer': index.query(question)}
    


# @app.route('/yt', methods=['POST'])
# def yt():
#     try:
#         link = request.form['url']
#         question = request.form['question']
#         loader = YoutubeLoader.from_youtube_channel(link, add_video_info=True)
#         loader.load()
#         index = VectorstoreIndexCreator().from_loaders([loader])
#         return index.query(question)  
#     except Exception as e:
#         return f'<h1> Error: {e} </h1>'      
    
    


if __name__ == '__main__':
    app.run(debug=True)
