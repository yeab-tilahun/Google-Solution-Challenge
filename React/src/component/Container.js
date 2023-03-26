/** @jsxImportSource @emotion/react */
import React from "react";
import { css } from "@emotion/react";
import Response from "./Response";

export default function Container(props) {
  return (
    <div
      css={css`
        background-color: #f5f5f5;
        border-radius: 10px;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.75);
        margin: 1em;
        padding: 0.5em;
        padding-left: 2em;
        font-size: 1em;
        font-weight: 500;
        color: #000;
      `}
    >
      {props.text}
      <Response text={props.text} />
    </div>
  );
}
