# Robot Framework
--------------------------------------------------------------------------
## Setup
```
  python -V
  pip -V
  pip install robotframework
  pip install robotframework-seleniumlibrary
```

## Open Browser ไม่ได้
brew cask install chromedriver

### run test
`robot [FileName].robot`

### run  only Tags Testing
`robot -i Testing [FileName].robot`

### change variable in script
`robot -v [VariableName]:http://facebook.com [FileName].robot`


## Note
- Library ตัวเดียวที่ไม่ต้อง import => Builtin  ที่เหลือนอกจากนี้ต้อง import เข้ามา
