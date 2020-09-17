{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_Craft3e (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,1,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\naruto\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\naruto\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.3\\Craft3e-0.1.1.1-8EzxZm7AF6dI4Hf7uBzuhD"
dynlibdir  = "C:\\Users\\naruto\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.3"
datadir    = "C:\\Users\\naruto\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.3\\Craft3e-0.1.1.1"
libexecdir = "C:\\Users\\naruto\\AppData\\Roaming\\cabal\\Craft3e-0.1.1.1-8EzxZm7AF6dI4Hf7uBzuhD\\x86_64-windows-ghc-8.6.3\\Craft3e-0.1.1.1"
sysconfdir = "C:\\Users\\naruto\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Craft3e_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Craft3e_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Craft3e_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Craft3e_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Craft3e_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Craft3e_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
