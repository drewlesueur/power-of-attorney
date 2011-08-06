borrowerImage = "borr.png"
coBorrowerImage = "co.png"
carImage = "car.png"
tradeImage = "trade.png"

module.exports = {
  outputDir: "",
  chromePath: "C:\\DOCUME~1\\DREWLE~1\\LOCALS~1\\APPLIC~1\\Google\\Chrome\\APPLIC~1\\chrome.exe",
  abcName: "ABC.EXE",

  offsetLeft: 9,
  offsetTop: 32,

  offsetLeft: 6,
  offsetTop: 32,

  fontWidth: 8,
  fontHeight: 12,

  changeToBlack: ['#ffff00', 'rgb(63,63,192)'],
  changeToTransparent: ['#000080', 'rgb(192,192,64)'],
  borrowerImage: borrowerImage,
  coBorrowerImage: coBorrowerImage,
  carImage: carImage,
  tradeImage: tradeImage,
  croppings: {
    borrowerName: [borrowerImage, [26, 5, 34, 1]],
    borrowerAddress: [borrowerImage, [26, 6, 34, 1]],
    borrowerZip: [borrowerImage, [26, 7, 10, 1]],
    borrowerCity: [borrowerImage, [26, 8, 12, 1]],
    borrowerState: [borrowerImage, [26, 9, 12, 1]],
  },
  forms : {
    powerOfAttorney: {
      background: "poa.png",
      images: {
        borrowerName: [63, 322 /*, width, height*/],
        borrowerAddress: [63, 355]
      }
    }
  },

  blank: true
}
