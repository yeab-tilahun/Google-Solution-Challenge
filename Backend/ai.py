from langchain import OpenAI
import os
import configparser
from langchain.document_loaders import PyPDFLoader, UnstructuredWordDocumentLoader, UnstructuredPowerPointLoader
from langchain.embeddings.openai import OpenAIEmbeddings
from langchain.vectorstores import Chroma
from langchain.chains import RetrievalQAWithSourcesChain

config = configparser.ConfigParser()
config.read('config.ini')
os.environ["OPENAI_API_KEY"] = config.get('API','OPEN_AI')

class AI:
    def __init__(self, path="modules", file_type="pdf"):
        self.path = path

        if file_type == "pdf":
            # self.pdfs = [f for f in os.listdir(self.path) if f.endswith('.pdf')]
            self.loaders = PyPDFLoader(self.path)
            # self.docs = [doc for loader in self.loaders for doc in loader.load_and_split()]
            self.docs = self.loaders.load()
        elif file_type == "docx":
            self.loaders = UnstructuredWordDocumentLoader(path)
            self.docs = self.loaders.load()
        else:
            self.loaders = UnstructuredPowerPointLoader(path)
            self.docs = self.loaders.load()
        
        self.embeddings = OpenAIEmbeddings()
        self.docsearch = Chroma.from_documents(self.docs, self.embeddings)
        self.chain = RetrievalQAWithSourcesChain.from_chain_type(OpenAI(temperature=0), chain_type="stuff", retriever=self.docsearch.as_retriever())

    def answer(self, question):
        return self.chain({"question": question}, return_only_outputs=True)

if __name__ == "__main__":
    for i in range(10):
        query = input("Query: ")
        print(chain({"question": query}, return_only_outputs=True))