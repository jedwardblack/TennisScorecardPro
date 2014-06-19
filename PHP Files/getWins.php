<?php
include "header.php";
$playerID = $_GET["playerID"];
  $sql = "SELECT games_won('".$playerID."');";
  $mysqli->query($sql);
    if($results = $mysqli->query($sql)) {
    while ($row = $results->fetch_assoc()) {                         
        echo $row["games_won('".$playerID."')"];
    }
  }
  else
     die($mysqli->error);
?>
<form action="showAllPlayers.php">
<button type="submit" name="Submit">Back</button>
</form>