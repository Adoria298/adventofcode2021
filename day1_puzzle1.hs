-- module day1_puzzle1 where
-- :set -package http-client -- from `runghc`output
-- https://hackage.haskell.org/package/http-client-0.5.13.1/docs/Network-HTTP-Client.html src of code below.
import Network.HTTP.Client
import Network.HTTP.Types.Status (statusCode)

main :: IO ()
main = do
  manager <- newManager defaultManagerSettings

  request <- parseRequest "http://httpbin.org/get"
  response <- httpLbs request manager

  putStrLn $ "The status code was: " ++ (show $ statusCode $ responseStatus response)
  print $ responseBody response