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
    borrowerLicence: [borrowerImage, [26, 17, 20, 1]],
    borrowerDOB: [borrowerImage, [26, 20, 20, 1]],

    vin: [carImage, [24, 15, 20, 1]],
    year: [carImage, [24, 9, 5, 1]],
    make: [carImage, [24, 10, 17, 1]],
    bodyStyle: [carImage, [24, 13, 17, 1]],
  },
  forms : {
    powerOfAttorney: {
      background: "poa.png",
      images: {
        borrowerName: [63, 322 /*, width, height*/],
        borrowerAddress: [63, 355],
        borrowerCity: [481, 355],
        borrowerState: [656, 355],
        borrowerZip: [696, 355],
        borrowerLicence: [482, 322],
        borrowerDOB: [633, 323],
        vin: [63, 164],
        year: [438, 164],
        make: [479, 164],
        bodyStyle: [637, 164],
      }
    }
  },

  blank: true
}
