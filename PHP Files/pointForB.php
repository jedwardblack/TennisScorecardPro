<table border="1">
<tr><th>GameID</th><th>Points Team A</th><th>Points Team B</th>
<th>Team A</th><th>Team B</th><th>Winning Player</th><th>Court</th></tr>
<?php
include "header.php";
$gameID = $_REQUEST["gameID"];
$sql = "UPDATE Games SET numPointsWonByb = numPointsWonByB+1 WHERE gameID = '".$gameID."';";
$mysqli->query($sql);
$sql2 = "SELECT * FROM Games WHERE gameID = '".$gameID."';";
$mysqli->query($sql2);
    if($results = $mysqli->query($sql2)) {
    while ($row = $results->fetch_assoc()) {
    	echo "<tr><td>" . $row["gameID"] . "</td>";
        echo "<td>" . $row["numPointsWonByA"] . "</td>";
        echo "<td>" . $row["numPointsWonByB"] . "</td>";
        echo "<td>" . $row["playerA"] . "</td>";
        echo "<td>" . $row["playerB"] . "</td>";
        echo "<td>" . $row["winningTeam"] . "</td>";
        echo "<td>" . $row["court"] . "</td>";
        echo "</tr>";
    }
  }
  else {
     	die($mysqli->error);
}
?>
</table>
</table>
<form action="pointForA.php">
<button type="submit" name="gameID" value="<?php echo $gameID;?>">Point For A</button>
</form>
<form action="pointForB.php">
<button type="submit" name="gameID" value="<?php echo $gameID;?>">Point For B</button>
</form>
<form action="insertWin.php">
Winning Player: <input type="text" name="winningPlayer" value= "<?php echo $winningPlayer;?>" required></br>
<input type="submit" name="gameID" value="<?php echo $gameID;?>">
</form>