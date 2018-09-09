###Install codesniffer
 - composer global require friendsofphp/php-cs-fixer @stable
 - add to $PATH ~/.config/composer/vendor/bin

php-cs-fixer fix ./ --dry-run
php-cs-fixer fix ./

### Add to vim
https://github.com/stephpy/vim-php-cs-fixer

configure .php_cs
