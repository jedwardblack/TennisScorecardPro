DELIMITER $$
CREATE FUNCTION `games_won'(playerID int) 
RETURNS int(11)
BEGIN
 DECLARE numWins INT;
 SELECT Count(*) INTO numWins FROM GamesWon
 WHERE gamesWonPlayerID = playerID;
 RETURN numWins;
END$$
DELIMITER ;
