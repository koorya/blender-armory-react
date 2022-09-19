import logo from "./logo.svg";
import "./App.css";
import runArmory from "./armory/kha";
import { useEffect, useState } from "react";

function App() {
  const [levelController, setLevelController] = useState(null);
  const [currentElement, setCurrentElement] = useState({ type: "col", pos: 0 });
  useEffect(() => {
    runArmory(window, window);
    setLevelController(new window.arm.CurrentLevelController());
    console.log("App created");

    return () => {};
  }, [setLevelController]);

  useEffect(() => {
    if (!levelController) return;
    if (new Date().getTime() - window.performance.timing.navigationStart < 5000)
      return;
    console.log(currentElement);
    levelController.setCurrentElement(currentElement);
  }, [currentElement, levelController]);

  return (
    <div className="App">
      <select
        name="type"
        id="pet-select"
        value={currentElement.type}
        onChange={(e) => {
          const type = e.currentTarget.value;
          setCurrentElement({ ...currentElement, type: type });
        }}
      >
        <option value="col">col</option>
        <option value="hor">hor</option>
        <option value="dia">dia</option>
      </select>

      <input
        type="text"
        value={currentElement.pos}
        onChange={(e) => {
          setCurrentElement({
            ...currentElement,
            pos: parseInt(e.currentTarget.value),
          });
        }}
      />

      <input
        type="button"
        value="mount current"
        onClick={() => levelController.mountCurrentElement()}
      />

      <p align="center">
        <canvas
          align="center"
          id="khanvas"
          width="1080"
          height="440"
          tabIndex={-1}
        ></canvas>
      </p>
    </div>
  );
}

export default App;
