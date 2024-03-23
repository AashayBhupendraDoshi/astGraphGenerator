import subprocess
import os

def clone_repo(url, path='codebases'):
    """
    Clones a GitHub repository to a specified directory.

    Args:
        url (str): The URL of the GitHub repository to clone.
        path (str, optional): The directory where the repository will be cloned. 
                              If not provided, 'codebases' in the root of the current 
                              repository will be used as the default directory.
    """
    # Get the root directory of the current repository
    root_dir = os.getcwd()
    # Create the full path where the repository will be cloned
    full_path = os.path.join(root_dir, path)

    # Create the directory if it does not exist
    os.makedirs(full_path, exist_ok=True)

    try:
        subprocess.check_call(['git', 'clone', url], cwd=full_path)
        print(f"Repository cloned successfully at {full_path}")
    except subprocess.CalledProcessError as e:
        print(f"An error occurred while cloning the repository: {e}")

# Usage
# clone_repo('https://github.com/user/repo.git')