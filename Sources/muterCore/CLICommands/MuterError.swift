import Rainbow

public enum MuterError: Error, Equatable {
    case configurationParsingError(reason: String)
    case projectCopyFailed(reason: String)
    case unableToCreateSwapFileDirectory(reason: String)
    case noSourceFilesDiscovered
    case noMutationPointsDiscovered
    case mutationTestingAborted(reason: MutationTestingAbortReason)
}

extension MuterError: CustomStringConvertible {
    public var description: String {
        
        switch self {
        case .configurationParsingError(let reason):
            return """
            Muter was unable to parse your configuration file.
            
            This is often caused from running Muter from the wrong directory, or having a corrupted or missing muter.conf.json
            
            You can run \("muter init".bold) to generate or regenerate a configuration file.
            
            ******************
            FileManager Error:
            \(reason)
            ******************
            
            If you feel this is a bug, or want help figuring out what could be happening, please open an issue at
            https://github.com/SeanROlszewski/muter/issues
            """
        case .projectCopyFailed(let reason):
            return """
            Muter was unable to create a temporary directory, or was unable to copy your project into a temporary directory, and cannot continue.
            
            This is unusual. Try running Muter again to see if that fixes the issue.
            Alternatively, try clearing all temp files from your temp directory by restarting your computer.
            
            If you can reproduce this, please consider filing a bug
            at https://github.com/SeanROlszewski/muter
            
            Please include the following in the bug report:
            *********************
            FileManager error: \(reason)
            """
        case .unableToCreateSwapFileDirectory(let reason):
            return """
            Muter was unable to create a swap file directory, which is a necessary component of it's mutation testing strategy.
            
            This is unusual. Try running Muter again to see if that fixes the issue. Alternatively, try clearing all temp files from your temp directory by restarting your computer.
            
            If you can reproduce this, please consider filing a bug
            at https://github.com/SeanROlszewski/muter
            
            Please include the following in the bug report:
            *********************
            FileManager error: \(reason)
            """
        case .noSourceFilesDiscovered:
            return """
            Muter wasn't able to discover any code it could mutation test.
            
            This is likely caused by misconfiguring Muter, usually by excluding a directory that contains your code.
            
            If you feel this is a bug, or want help figuring out what could be happening, please open an issue at
            https://github.com/SeanROlszewski/muter/issues
            """
        case .noMutationPointsDiscovered:
            return """
            Muter wasn't able to discover any code it could mutation test.
            
            This is likely caused by misconfiguring Muter, usually by excluding a directory that contains your code.
            
            If you feel this is a bug, or want help figuring out what could be happening, please open an issue at
            https://github.com/SeanROlszewski/muter/issues
            """
        case .mutationTestingAborted(let reason):
            return """
            \(reason)
            """
        }
        
    }
    
}
