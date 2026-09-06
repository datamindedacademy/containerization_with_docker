import React from "react";
import PostgresConnection from "./PostgresConnection";
import BackendConnection from "./BackendConnection";
import Exercise from "./Exercise";

const ExerciseList = () => (
  <div className="exercise-list">
    <h3>Hey students of the Docker course 👋 ! This is the frontend !</h3>
    <Exercise exerciseNumber="Test connection to the backend" ExerciseComponent={<BackendConnection />} />
    <Exercise exerciseNumber="Test connection to the backend -> PostGresDB" ExerciseComponent={<PostgresConnection />} />
  </div>
);

export default ExerciseList;
