import React, { useEffect,useCallback, useState } from "react";
import Container from "./Container";


export default function Response({ text }) {
  const [response, setResponse] = useState(null);
  const endpoint = 'https://b1bd-149-34-244-156.eu.ngrok.io/question';

  useEffect(() => {
    const postData = async () => {
      try {
        const data = { question: text };
        const response = await fetch(endpoint, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(data)
        });
    
        const result = await response.json();
        setResponse(result);
      } catch (error) {
        console.error('Error during POST request:', error);
      }
    };

    postData();
  }, []);

  return (
    <div>
      {response ? <Container text = {response.answer}/> : <Container text = {"Loading..."}/>}
    </div>
  );
}