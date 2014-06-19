DELIMITER //

CREATE TRIGGER game_won
AFTER UPDATE ON Games

FOR EACH ROW
BEGIN

IF (((NEW.numPointsWonByA>=6) OR (NEW.numPointsWonByB>=6)) 
	AND (ABS(NEW.numPointsWonByA-NEW.numPointsWonByB)>=2)) THEN 
BEGIN
	IF (NEW.numPointsWonByA-NEW.numPointsWonByB>=2) THEN 
		BEGIN
			INSERT INTO GamesWon (gamesWonGameID, gamesWonPlayerID) VALUES 
			(Games.gameID, Games.playerA);
		END;
	ELSE
		BEGIN 
			INSERT INTO GamesWon (gamesWonGameID, gamesWonPlayerID) VALUES 
			(Games.gameID, Games.playerB);
		END;
	END IF;
END;
END IF;
END;//
DELIMITER ;