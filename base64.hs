module Main (main) where

    import Data.ByteString.Base64.Lazy
    import Data.ByteString.Lazy as B
    import System.Environment
    import Control.Monad
    import Control.Applicative

    main = do
    		args <- getArgs
    		case args of 
    			(a:[]) -> Prelude.putStrLn "Invalid input. Expected no args for stdin / stdout or two args for files (in file and out file)"
    			[] -> B.interact encode -- Use stdin and stdout
    			(inFile:outFile:_) -> usingFiles inFile outFile -- Take input from input file and write result to an output file

    usingFiles :: FilePath -> FilePath -> IO ()
    usingFiles inFile outFile = (liftM encode $ B.readFile inFile) >>= B.writeFile outFile
