<table border="1">
<tr><th>PlayerID</th><th>Username</th><th>First Name</th><th>Last Name</th>
<th>Gender</th><th>Delete</th><th>Update</th></tr>
<?php
  include "header.php";
  $sql = "SELECT * FROM Players;";
  $mysqli->query($sql);
    if($results = $mysqli->query($sql)) {
    while ($row = $results->fetch_assoc()) {
    	echo "<tr><td>" . $row["playerID"] . "</td>";
        echo "<td>" . $row["userName"] . "</td>";
        echo "<td>" . $row["fName"] . "</td>";
        echo "<td>" . $row["lName"] . "</td>";
        echo "<td>" . $row["gender"] . "</td>";
        echo "<td><a href='deletePlayer.php?playerID=" . $row["playerID"] . "'>Delete</a></td>";
        echo "<td><a href='updatePlayer.php?playerID=" . $row["playerID"] . "'>Update</a></td>";
        echo "</tr>";
    }
  }
  else {
     	die($mysqli->error);
}
?>
</table>
<form action="insertPlayersSingles.php" method="post">
<input type="submit" name="newMatch" value="New Player">
</form>
<form action="insertGame.php"></br></br>
Select two players:</br>
Player1ID: <input type="text" name="player1ID" value= "<?php echo $player1ID;?>" required></br>
Player2ID: <input type="text" name="player2ID" value= "<?php echo $player2ID;?>" required></br>

<button type="submit" name="submitButton" value="Insert Game">Insert Game</button>
</form>

<form action="getWins.php"></br></br>
Get number of Wins:</br>
PlayerID: <input type="text" name="playerID" value= "<?php echo $playerID;?>" required></br>
<button type="submit" name="submitButton" value="Insert Game">Get Wins</button>
</form>
<form action="showGames.php"></br></br>
Show All Games Played:</br>
<button type="submit" name="submitButton" value="showAll">Show All</button>
</form>
