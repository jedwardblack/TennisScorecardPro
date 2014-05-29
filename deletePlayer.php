<?php
include 'header.php';
$playerID = $_REQUEST["playerID"];

if(strlen($playerID) > 0) {
  $sql = "delete from Players where playerID=$playerID";
  $mysqli->query($sql);  
}
?>
<script>
window.location='showAllPlayers.php';
</script>
