import React, { useState, useEffect } from "react";
import "./App.css";

export function App() {
  const [keyVisible, setKeyVisible] = useState(true);
  const [keyPicked, setKeyPicked] = useState(false);
  const [openedChest, setOpenedChest] = useState(false);
  const [sheetVisible, setSheetVisible] = useState(true);
  const [rubyVisible, setRubyVisible] = useState(true);
  const [potionVisible, setPotionVisible] = useState(true);
  const [doorClosed, setDoorClosed] = useState(true);
  const [mapPicked, setMapPicked] = useState(false);
  const [allItemsPicked, setAllItemsPicked] = useState(false);
  const [showIframe, setShowIframe] = useState(false);

  useEffect(() => {
    if (!rubyVisible && !sheetVisible && !potionVisible) {
      setAllItemsPicked(true);
    }
  }, [rubyVisible, sheetVisible, potionVisible]);

  return (
    <main>
      <div>
        <img
          src="img/ruby.png"
          className="ruby"
          style={{
            visibility: openedChest && rubyVisible ? "visible" : "hidden",
          }}
          onClick={() => {
            setRubyVisible(false);
            alert("Has recogido el ruby");
          }}
        />
        <OpenChest
          openedChest={openedChest}
          setOpenedChest={setOpenedChest}
          keyPicked={keyPicked}
          allItemsPicked={allItemsPicked}
        />
        <PickedKey
          keyVisible={keyVisible}
          setKeyVisible={setKeyVisible}
          setKeyPicked={setKeyPicked}
        />
        <img src="img/skulls.png" className="skulls" />
        <img
          src="img/sheet.png"
          className="sheet"
          style={{
            visibility: openedChest && sheetVisible ? "visible" : "hidden",
          }}
          onClick={() => {
            setSheetVisible(false);
            setMapPicked(true);
            alert(
              "Has recogido el mapa, ahora debes ir a la puerta y introducir el código del mapa: 1234"
            );
          }}
        />
        <ScapeRoom
          mapPicked={mapPicked}
          setDoorClosed={setDoorClosed}
          setShowIframe={setShowIframe}
        />{" "}
        <img
          src="img/potion.png"
          className="potion"
          style={{
            visibility: openedChest && potionVisible ? "visible" : "hidden",
          }}
          onClick={() => {
            setPotionVisible(false);
            alert("Has recogido la poción");
          }}
        />
        <img src="img/hangKeys.png" className="hangKeys" />
        <img src="img/torch.png" className="torch" />
      </div>
      {showIframe && <IframeOverlay />}{" "}
    </main>
  );
}

export function PickedKey({ keyVisible, setKeyVisible, setKeyPicked }) {
  const handleKeyClick = () => {
    alert("Has recogido la llave, introdúcela en el cofre");
    setKeyVisible(false);
    setKeyPicked(true);
  };

  return (
    <img
      src="img/key.png"
      className="key"
      onClick={handleKeyClick}
      style={{ visibility: keyVisible ? "visible" : "hidden" }}
    />
  );
}

export function OpenChest({
  openedChest,
  setOpenedChest,
  keyPicked,
  allItemsPicked,
}) {
  const handleOpenedChest = () => {
    if (keyPicked) {
      setOpenedChest(true);
      alert("El cofre ha sido abierto, agarra los 3 elementos");
    } else {
      alert("Primero debes recoger la llave para abrir el cofre");
    }
  };

  return (
    <div className="chest-container">
      {openedChest ? (
        allItemsPicked ? (
          <img src="img/opened_chest.png" className="openedChestImage" />
        ) : (
          <video src="video/video1.webm" autoPlay className="chest-video" />
        )
      ) : (
        <img
          src="img/closed_chest.png"
          className="closedChest"
          onClick={handleOpenedChest}
        />
      )}
    </div>
  );
}

export function ScapeRoom({ mapPicked, setDoorClosed, setShowIframe }) {
  const handleDoorClick = () => {
    if (mapPicked) {
      const code = prompt("Introduce el código del mapa:");
      if (code === "1234") {
        setDoorClosed(false);
        setShowIframe(true);
        alert("La puerta se ha abierto, ¡has escapado!");
      } else {
        alert("Código incorrecto, intenta de nuevo.");
      }
    } else {
      alert("Necesitas recoger el mapa primero.");
    }
  };

  return (
    <img
      src="img/door.png"
      className="door"
      onClick={handleDoorClick}
      style={{ cursor: "pointer" }}
    />
  );
}

function IframeOverlay() {
  return (
    <div className="iframe-overlay">
      <iframe src="./interface3.html" className="iframe-content"></iframe>
    </div>
  );
}
