import React, { useState } from 'react';
import './App.css';

export function App() {
  const [keyVisible, setKeyVisible] = useState(true);
  const [keyPicked, setKeyPicked] = useState(false);
  const [openedChest, setOpenedChest] = useState(false);
  const [sheetVisible, setSheetVisible] = useState(true);
  const [rubyVisible, setRubyVisible] = useState(true);
  const [potionVisible, setPotionVisible] = useState(true);

  return (
    <main>
      <div>
        <img src="img/ruby.png" className="ruby" style={{ visibility: (openedChest && rubyVisible) ? 'visible' : 'hidden' }} onClick={() => {
          setRubyVisible(false);
          alert('Has recogido el ruby');
        }} />
        <OpenChest openedChest={openedChest} setOpenedChest={setOpenedChest} keyPicked={keyPicked} />
        <PickedKey keyVisible={keyVisible} setKeyVisible={setKeyVisible} setKeyPicked={setKeyPicked} />
        <img src="img/skulls.png" className="skulls" />
        <img src="img/sheet.png" className="sheet" style={{ visibility: (openedChest && sheetVisible) ? 'visible' : 'hidden' }} onClick={() => {
          setSheetVisible(false);
          alert('Has recogido el mapa, ahora debes ir a la puerta y introducir el código del mapa: 1234');
        }} />
        <img src="img/door.png" className="door" />
        <img src="img/potion.png" className="potion" style={{ visibility: (openedChest && potionVisible) ? 'visible' : 'hidden' }} onClick={() => {
          setPotionVisible(false);
          alert('Has recogido la poción');
        }} />
        <img src="img/hangKeys.png" className="hangKeys" />
      </div>
    </main>
  );
}



export function PickedKey({ keyVisible, setKeyVisible, setKeyPicked }) {
  const handleKeyClick = () => {
    alert('Has recogido la llave, introdúcela en el cofre');
    setKeyVisible(false);
    setKeyPicked(true);
  };

  return (
    <img
      src="img/key.png"
      className="key"
      onClick={handleKeyClick}
      style={{ visibility: keyVisible ? 'visible' : 'hidden' }}
    />
  );
}

export function OpenChest({ openedChest, setOpenedChest, keyPicked }) {
  const handleOpenedChest = () => {
    if (keyPicked) {
      setOpenedChest(true);
      alert('El cofre ha sido abierto, agarra los 3 elementos');
    } else {
      alert('Primero debes recoger la llave para abrir el cofre');
    }
  };

  return (
    <div className="chest-container">
      {openedChest ? (
        <video src="video/video1.webm" autoPlay className="chest-video" />
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

export function ScapeRoom()



