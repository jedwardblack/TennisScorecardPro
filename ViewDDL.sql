CREATE VIEW player_stats AS 
SELECT Players.playerID AS playerID,
Players.userName AS userName,
Players.fName AS fName,
Players.lName AS lName,
Players.gender AS gender,
Games.gameID AS gameID,
Games.numPointsWonByA AS numPointsWonByA,
Games.numPointsWonByB AS numPointsWonByB,
Games.playerA AS playerA,
Games.playerB AS playerB,
Games.court AS court 
FROM (Players join Games) 
WHERE ((Players.playerID = Games.playerA) OR (Players.playerID = Games.playerB));
