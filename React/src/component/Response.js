import React, { useEffect,useCallback } from "react";
import Container from "./Container";

export default function Response(props) {
  // fetch server

  // useEffect(() => {
  //     fetch('https://0cbc-149-34-244-156.eu.ngrok.io/answer').then(res => res.json()).then(data => console.log(data))
  // }, [])

  // post to server

  // const postData =  useCallback(async () => {
 
  //   const data = { question: props.text };

  
  //   const response = await fetch("https://0cbc-149-34-244-156.eu.ngrok.io/question", {
  //     method: 'POST',
  //     headers: {
  //       'Content-Type': 'application/json'
  //     },
  //     body: JSON.stringify(data)
  //   });
  
  //   const result = await response.json();
  //   console.log(result);
  
  // });

  // console.log(postData());

  const postData = useCallback(async () => {
    const data = { question: props.text };
  
    const response = await fetch("https://0cbc-149-34-244-156.eu.ngrok.io/question", {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    });
  
    const result = await response.json();
    console.log(result);
  }, []);

   postData();


  //  useEffect(() => {
  //   fetch("https://0cbc-149-34-244-156.eu.ngrok.io/answer", {
  //     method: "POST",
  //     headers: {
  //       "Content-Type": "application/json",
  //     },
  //     body: JSON.stringify({ question: props.text }),
  //   },[])
  //     .then((res) => res.json())
  //     .then((data) => console.log(data));

  // }, []);

  // const fetchMoviesHandler = useCallback(async () => {
  //   setIsLoading(true);
  //   setError(null);
  //   try {
  //     const response = await fetch('https://swapi.dev/api/films/');
  //     if (!response.ok) {
  //       throw new Error('Something went wrong!');
  //     }

  //     const data = await response.json();

  //     const transformedMovies = data.results.map((movieData) => {
  //       return {
  //         id: movieData.episode_id,
  //         title: movieData.title,
  //         openingText: movieData.opening_crawl,
  //         releaseDate: movieData.release_date,
  //       };
  //     });
      
  //   } catch (error) {
  
  //   }
 
  // }, []);

  // return  <Container key={Math.random()} text = {response}/>
}
