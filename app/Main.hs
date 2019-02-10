module Main where

import qualified Codec.Archive.Zip as Z
import qualified Data.ByteString.Lazy.Char8 as C
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    case args of  
        (bk2: lsmv : _) -> do
            bk2Contents <- C.readFile bk2
            lsmvContents <- C.readFile lsmv
            C.putStr (convertBk2 bk2Contents lsmvContents)
        _ -> errorWithoutStackTrace "Invalid aguments. Usage: input_bk2.bk2 lsmv_to_modify.lsmv > output_file.lsmv"
  
convertBk2 :: C.ByteString -> C.ByteString -> C.ByteString
convertBk2 bk2 lsmv = Z.fromArchive (Z.addEntryToArchive convertedEntry lsmvA) where
    inputLogEM = Z.findEntryByPath "Input Log.txt" . Z.toArchive $ bk2
    inputLogE = maybe (error "No input log file") id inputLogEM
    inputLog = Z.fromEntry inputLogE
    time = Z.eLastModified inputLogE
    converted = parseInput inputLog
    convertedEntry = Z.toEntry "input" time converted
    lsmvA = Z.toArchive lsmv

parseInput :: C.ByteString -> C.ByteString
parseInput = C.unlines . map convertFrame . drop 3 . init . C.lines

convertFrame :: C.ByteString -> C.ByteString
convertFrame line = C.pack ("F. 0 0|" ++ outputBtns) where 
    inputBtns = drop 4 . C.unpack $ line
    (up: down: left: right: select: start: y: b: x: a: l: r: _) = inputBtns
    outputBtns = [b, y, select, start, up, down, left, right, a, x, l, r]