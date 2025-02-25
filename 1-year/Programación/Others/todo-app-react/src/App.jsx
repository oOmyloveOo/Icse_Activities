import './App.css';
import { TaskTrashIcon } from 'components'
import React, { useState } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faTrash } from '@fortawesome/free-solid-svg-icons';

export function App() {
  return (
    <article>
    <header>
      <div className='to-do-list-title'>
        <strong>TO DO LIST</strong>
      </div>
    </header>
    
    <aside>
      <CreateTaskButton />
    </aside>
    </article>
  )
}

export function CreateTaskButton() {
  const [count, setCount] = useState(0);
  const [tasks, setTasks] = useState([]);

  function HandleClick() {
      setCount(prevCount => count + 1);
      const newTask =  (
      <div className='task-section'> 
        <input type="checkbox" className='task-checkbox'/> 
        <FontAwesomeIcon icon={faTrash} className='trash-icon' />
        <input type="text" className='task-text'/>
      </div>
    );
      setTasks([...tasks,newTask])
    }

    function HandleDelete() {
      const updatedtasks = 
      setTasks(updatedtasks);
      setCount(prevCount => count - 1);
    }

    return (
      <div>
      <button onClick={HandleClick} className='task-button'>
        Add Task {count}
      </button>
      <div>
        {tasks.map(element => element)}
      </div>
    </div>
    );
}
