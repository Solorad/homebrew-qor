# Qordoba CLI homebrew tap

1. Install homebrew tap 
   ```
   brew tap qordobacode/qor
   ```
2. Install qor app   
   ```
   brew install qordobacode/qor/qor
   ```
3. Install qor app locally:   
   ```
   brew create 'https://github.com/Qordobacode/Cli-v2/archive/version-0.7.tar.gz' qor
   ```
4. Audit formula   
    ```bash
    brew audit --strict qor
5. Install from source     
   ```bash
    sudo chmod 644 /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/qor.rb
    brew install --build-from-source qor
    ```
6. Remove qor    
   ```bash
    brew remove qor
    ```