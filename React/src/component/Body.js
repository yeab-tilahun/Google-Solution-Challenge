/** @jsxImportSource @emotion/react */
import React, { useState, useRef, useEffect } from "react";
import Go from "../assets/Go.png";
import Styles from "./Body.module.css";
import { css } from "@emotion/react";
import Container from "./Container";

export default function Body() {
  const input = useRef(null);
  const [text, setText] = useState([]);
  const [file, setFile] = useState("");
  const chatWindowRef = useRef(null);
  
  useEffect(() => {
    chatWindowRef.current.scrollTop = chatWindowRef.current.scrollHeight;
  }, [text]);

  const onInputHandler = (e) => {
    e.preventDefault();
    setText((prev) => [...prev, input.current.value]);
    // input.current.value = "";
  };

  return (
    <div ref={chatWindowRef} className={Styles.body}>
    
      { text.length > 0 && text.map((txt) =>
      <Container key={Math.random()} text = {txt}/> 
      )   }

      <div className={Styles.inputContainer}>
        <form
          css={css`
            width: 100%;
            display: flex;
            justify-content: center;
          `}
          onSubmit={onInputHandler}
        >
          <input
            ref={input}
            className={Styles.Input}
            type="text"
            placeholder="      Ask me questions from your modules."
          />
          <input className={Styles.btn} type="file"></input>
        </form>
      </div>
    </div>
  );
}
