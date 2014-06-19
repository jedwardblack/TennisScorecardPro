<table border="1">
<tr><th>GameID</th><th>PlayerID</th><th>Username</th><th>First Name</th><th>Last Name</th><th>Gender</th><th>Points A</th><th>Points B</th><th>Player A</th><th>Player B</th><th>Court</th></tr>
<?php
  include "header.php";
  $sql = "SELECT * FROM player_stats;";
  $mysqli->query($sql);
    if($results = $mysqli->query($sql)) {
    while ($row = $results->fetch_assoc()) {
    	echo "<tr><td>" . $row["gameID"] . "</td>";
    	echo "<td>" . $row["playerID"] . "</td>";
        echo "<td>" . $row["userName"] . "</td>";
        echo "<td>" . $row["fName"] . "</td>";
        echo "<td>" . $row["lName"] . "</td>";
        echo "<td>" . $row["gender"] . "</td>";
        echo "<td>" . $row["numPointsWonByA"] . "</td>";
        echo "<td>" . $row["numPointsWonByB"] . "</td>";
        echo "<td>" . $row["playerA"] . "</td>";
        echo "<td>" . $row["playerB"] . "</td>";
        echo "<td>" . $row["court"] . "</td>";
        echo "</tr>";
    }
  }
  else {
     	die($mysqli->error);
}
?>
</table>
<form action="showAllPlayers.php">
<button type="submit" name="Submit">Back</button>
</form>