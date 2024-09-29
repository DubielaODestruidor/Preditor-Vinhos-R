import React from "react";
import wineLogo from "./wine-svgrepo-com.svg";
import "./App.css";

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={wineLogo} className="App-logo" alt="logo" />
        <div className="mother-box">
          <div className="child-box">
            <label htmlFor="caixa" className="text">
              Selecione a cor do vinho:
            </label>
            <select id="dropdown" className="box">
              <option value="vermelho">vermelho</option>
              <option value="branco">branco</option>
            </select>
          </div>
          <div className="child-box">
            <label htmlFor="caixa" className="text">
              Indique a acidez fixa:
            </label>
            <input
              type="number"
              id="caixa"
              name="caixa"
              className="box"
              placeholder="0.00"
            />
          </div>
        </div>
        <div className="mother-box">
          <div className="child-box">
            <label htmlFor="caixa" className="text">
              Indique a volatilidade:
            </label>
            <input
              type="number"
              id="caixa"
              name="caixa"
              className="box"
              placeholder="0.00"
            />
          </div>
          <div className="child-box">
            <label htmlFor="caixa" className="text">
              Indique o ácido cítrico:
            </label>
            <input
              type="number"
              id="caixa"
              name="caixa"
              className="box"
              placeholder="0.00"
            />
          </div>
        </div>
        <div className="mother-box">
          <div className="child-box">
            <label htmlFor="caixa" className="text">
              Indique o açúcar residual:
            </label>
            <input
              type="number"
              id="caixa"
              name="caixa"
              className="box"
              placeholder="0.00"
            />
          </div>
          <div className="child-box">
            <label htmlFor="caixa" className="text">
              Indique o cloreto:
            </label>
            <input
              type="number"
              id="caixa"
              name="caixa"
              className="box"
              placeholder="0.00"
            />
          </div>
        </div>
        <div className="mother-box">
          <div className="child-box">
            <label htmlFor="caixa" className="text">
              Indique o dióxido de enxofre livre:
            </label>
            <input
              type="number"
              id="caixa"
              name="caixa"
              className="box"
              placeholder="0.00"
            />
          </div>
          <div className="child-box">
            <label htmlFor="caixa" className="text">
              Indique o dioxide de enxofre total:
            </label>
            <input
              type="number"
              id="caixa"
              name="caixa"
              className="box"
              placeholder="0.00"
            />
          </div>
        </div>
        <div className="mother-box">
          <div className="child-box">
            <label htmlFor="caixa" className="text">
              Indique a densidade:
            </label>
            <input
              type="number"
              id="caixa"
              name="caixa"
              className="box"
              placeholder="0.00"
            />
          </div>
          <div className="child-box">
            <label htmlFor="caixa" className="text">
              Indique o pH:
            </label>
            <input
              type="number"
              id="caixa"
              name="caixa"
              className="box"
              placeholder="0.00"
            />
          </div>
        </div>
        <div className="mother-box">
          <div className="child-box">
            <label htmlFor="caixa" className="text">
              Indique o sulfato de potássio:
            </label>
            <input
              type="number"
              id="caixa"
              name="caixa"
              className="box"
              placeholder="0.00"
            />
          </div>
          <div className="child-box">
            <label htmlFor="caixa" className="text">
              Indique o álcool:
            </label>
            <input
              type="number"
              id="caixa"
              name="caixa"
              className="box"
              placeholder="0.00"
            />
          </div>
        </div>
        <button className="send-button">Enviar</button>
        <div className="output">
          <h1>Qualidade:</h1>
          <p>Resultado aqui</p>
        </div>
      </header>
    </div>
  );
}

export default App;
