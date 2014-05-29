<form>
Player1</br>
<input type="hidden" name="playerID" value= "<?php echo $playerID;?>" >
Username: <input type="text" name="username" value= "<?php echo $username;?>" required></br>
First Name: <input type="text" name="fName" value= "<?php echo $fName;?>"></br>
Last Name: <input type="text" name="lName" value= "<?php echo $lName;?>"></br>
Gender: <input type="text" name="gender" value= "<?php echo $gender;?>"></br></br>
<button type="submit" name="submitButton" value="Insert Players">Insert Players</button>
</form>
<form action="showAllPlayers.php"><button type="submit">Show All Players</button></form>
<?php
include "header.php";
$playerID = $_REQUEST["playerID"];
$username = $_REQUEST["username"];
$fName = $_REQUEST["fName"];
$lName = $_REQUEST["lName"];
$gender = $_REQUEST["gender"];
$sql = "insert into Players (username,fName,lName,gender) Values 
	('" . $username ."','" . $fName ."','" . $lName ."','" . $gender .  "');";
$mysqli->query($sql);
?>