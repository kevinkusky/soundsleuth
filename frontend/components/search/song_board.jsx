import React, { useState, useEffect } from 'react';

function Song() {
  let timeIntervals = [1, 3, 6, 10, 15]

  const [count, setCount] = useState(0);

  useEffect(() => {
    // Mount and update behavior
    
    // Return when component unmounts
    return () => {

    };
  }, [seconds]);

  return (
    <div>
      <h1>Hello there {seconds} times</h1>
      <button onClick={() => setSeconds(seconds + 1)}>Say Hi</button>
    </div>
  )
}

export default Song;