<?php
include "header.php";
$winnerID = $_GET["winningPlayer"];
$gameID = $_GET["gameID"];
$sql = "Insert into GamesWon (gamesWonGameID, gamesWonPlayerID) VALUES ('".$gameID."','".$winnerID."');";
    if($results = $mysqli->query($sql)) {
    	echo "Congratulations!";
    }
    else {
     	die($mysqli->error);
}
?>
<form action="showAllPlayers.php">
<button type="submit" name="Submit">Start A New Game</button>
</form>