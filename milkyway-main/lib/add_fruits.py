import re

file_path = "constant/app_lists.dart"

with open(file_path, "r") as f:
    content = f.read()

fruits_data = [
    {
        "name": "Apple",
        "desc": "Apples are crisp, juicy fruits that are rich in dietary fiber and vitamin C. They come in various varieties such as Fuji, Gala, and Granny Smith, making them a popular choice for snacks and desserts.",
        "rating": "4.8",
        "image": "https://media.istockphoto.com/id/1276397071/photo/juicy-apples-placed-on-a-wooden-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=jXly8GBW5DPeAuwNOs0JGbV4-4-vbQgUOgf3R6-rJvs=",
        "related": [
            "https://media.istockphoto.com/id/1127731060/photo/healthy-eating-pretty-girl-biting-fresh-apple.webp?a=1&b=1&s=612x612&w=0&k=20&c=Biw1grE0yxt4L3hVrujcwZU8PQPEghXYiBuBO2k0f9s=",
            "https://media.istockphoto.com/id/1301325736/photo/portrait-of-young-woman-stock-photo.webp?a=1&b=1&s=612x612&w=0&k=20&c=efBJOSxKUzTfrBPBQbJcNppFq4YcdgtajPyf-zWb7SY=",
            "https://media.istockphoto.com/id/1496340196/photo/apple.webp?a=1&b=1&s=612x612&w=0&k=20&c=NiDFmzxodZAJHG9N47owINkp27HB2hlyY8v98PJrf2c="
        ],
        "variations": [("500 gm", "₹90.00"), ("2 kg", "₹350.00")]
    },
    {
        "name": "Banana",
        "desc": "Bananas are a rich source of potassium and energy-boosting carbohydrates. They are widely consumed as a snack or added to smoothies and desserts.",
        "rating": "4.7",
        "image": "https://media.istockphoto.com/id/1494763483/photo/banana-concept.webp?a=1&b=1&s=612x612&w=0&k=20&c=NKgZvwkV4qwBdRPNyrUMVX2Xtczm65sT-_X5jEySQLg=",
        "related": [
            "https://media.istockphoto.com/id/526766433/photo/peeling-a-banana-in-the-kitchen.webp?a=1&b=1&s=612x612&w=0&k=20&c=1JiZ9_NVMaOwII4R3tDDHLMaBPvxYnGXfVsVMYAQJ0k=",
            "https://media.istockphoto.com/id/1291625666/photo/banana-fruit-in-the-cart.webp?a=1&b=1&s=612x612&w=0&k=20&c=d33w7siMngaa8nsl7gB9zu0rRgNlAANgpYJv3QbFhkg=",
            "https://media.istockphoto.com/id/1341372419/photo/bunch-of-yellow-ripe-bananas-on-a-dark-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=_viq_mSKYos7XHyu1TX4hHGjRBC8VpfJwcPkiR9glgw="
        ],
        "variations": [("500 gm", "₹35.00"), ("2 kg", "₹110.00")]
    },
    {
        "name": "Orange",
        "desc": "Oranges are citrus fruits known for their vibrant flavor and high vitamin C content. They are often eaten fresh or used in juices and desserts.",
        "rating": "4.6",
        "image": "https://media.istockphoto.com/id/923399162/photo/close-up-of-fresh-ripe-oranges-citrus-aurantium-without-peel-on-wooden-surface.webp?a=1&b=1&s=612x612&w=0&k=20&c=c-n_udq55V5PWNGrwO4wUd8dig6Uug_4AIat3gIOaQc=",
        "related": [
            "https://media.istockphoto.com/id/1091565360/photo/bowl-of-fresh-orange-fruit-salad.webp?a=1&b=1&s=612x612&w=0&k=20&c=GIDBH3jghNz3UqvI2r7E9MKmaWBysKwRnMnmvYQJhsM=",
            "https://media.istockphoto.com/id/1207074330/photo/close-up-of-womans-hand-buying-fresh-oranges-from-fruit-shop.webp?a=1&b=1&s=612x612&w=0&k=20&c=Bozvcqmf9qv_TECp2kEIZIFzNIXVUTDJPEuhCWl6gxM=",
            "https://media.istockphoto.com/id/1249115936/photo/pretty-woman-holding-glass-with-tasty-juice.webp?a=1&b=1&s=612x612&w=0&k=20&c=NUhgW9H5aBlbJewScxsBdBhTu2m0VhtYzdp3YqpHjrM="
        ],
        "variations": [("500 gm", "₹65.00"), ("2 kg", "₹230.00")]
    },
    {
        "name": "Grapes",
        "desc": "Grapes are sweet, juicy fruits available in green, red, or black varieties. They are rich in antioxidants and commonly consumed fresh or as raisins.",
        "rating": "4.5",
        "image": "https://media.istockphoto.com/id/952308852/photo/hand-of-farmer-in-september-check-and-collects-the-selected-grape-bunches-in-india-maharastra.webp?a=1&b=1&s=612x612&w=0&k=20&c=SdDnoAaj1hlc83U5Gmpmbh9RmggGMH3B1gVMRhQ1P8E=",
        "related": [
            "https://media.istockphoto.com/id/489520104/photo/green-grape-isolated-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=wgd0VVD_5P7LNMmnstGQ4FaG1FsLaIwCSxkyfuxXsNo=",
            "https://media.istockphoto.com/id/514110388/photo/white-wine-grapes-wachau.webp?a=1&b=1&s=612x612&w=0&k=20&c=dPnhD5O1INa2R7o61mtDSd5GvYGfXl-HXDrqxRg2QCI=",
            "https://media.istockphoto.com/id/1790901317/photo/delicious-shine-muscat-on-jute-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=2SfJOHz3lKsgq-eIZ61JIQcfTDiegyRM4jL5eW1KupM="
        ],
        "variations": [("250 gm", "₹50.00"), ("2 kg", "₹350.00")]
    },
    {
        "name": "Mango",
        "desc": "Mangoes are tropical fruits prized for their sweet, juicy flesh and distinct aroma. Known as the 'king of fruits,' they are rich in vitamins A and C.",
        "rating": "4.9",
        "image": "https://media.istockphoto.com/id/1018458760/photo/sliced-and-dried-mango.webp?a=1&b=1&s=612x612&w=0&k=20&c=pvx1424Wn9kJI-vVnCrfrwg_USYeQJJecwI22Dyz7x0=",
        "related": [
            "https://media.istockphoto.com/id/688858728/photo/girl-eating-mango.webp?a=1&b=1&s=612x612&w=0&k=20&c=kWa4DnVfrKV7HrMDstbjvTrWcbeePcTTsWtCW4Dg72U=",
            "https://media.istockphoto.com/id/1318973540/photo/indian-alphonso-mango-fruits-in-grass-closeup.webp?a=1&b=1&s=612x612&w=0&k=20&c=wQWrNbWQgsJbWUSx3a7thHRVLld3DxrVWrTAcyf_dU0=",
            "https://media.istockphoto.com/id/1398814319/photo/indian-mangoes-in-basket-blue-dark-background-close-up-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=tbT1cRMy7dD6wU167vj39UuEA8FD78s8NgMZLbCY9ZU="
        ],
        "variations": [("500 gm", "₹80.00"), ("2 kg", "₹290.00")]
    },
    {
        "name": "Pineapple",
        "desc": "Pineapples are tropical fruits with a tangy, sweet flavor. They are rich in bromelain and vitamin C, making them a nutritious addition to salads and desserts.",
        "rating": "4.7",
        "image": "https://media.istockphoto.com/id/1217479737/photo/pineapple-with-slices-isolated-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=e0fBVPuUPeYveDcS5pP1K9CeXg7rRpdsdNxe22GtAGc=",
        "related": [
            "https://media.istockphoto.com/id/1064819674/photo/whole-with-slice-ripe-pineapple-isolated-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=MGP1PF-OUPyORsilW7ijYXYQLgGXnPsjsKnnK-DYYl0=",
            "https://media.istockphoto.com/id/1681770441/photo/pineapple-fruits-in-the-market-for-sale-close-up-of-the-fruit.webp?a=1&b=1&s=612x612&w=0&k=20&c=lCo-RDoKMrBnBMxMLMEZ3AKG3vpWb057bp0gOZBPI0g=",
            "https://media.istockphoto.com/id/1297467444/photo/thai-red-curry-dinner.webp?a=1&b=1&s=612x612&w=0&k=20&c=J8XCwWoowOE4XC4dsZy_XJ7FPCj3qGMonJzWVFegy_A="
        ],
        "variations": [("2 pc", "₹150.00"), ("3 pc", "₹220.00")]
    }
]

new_products = ""
current_id = 171

for fruit in fruits_data:
    for weight, price in fruit['variations']:
        prod = f'''    ProductModel(
      quantity: "0",
      id: {current_id},
      name: "{fruit['name']}",
      weight: "{weight}",
      price: "{price}",
      isFavourite: 0,
      isDaily: 0,
      description: "{fruit['desc']}",
      rating: "{fruit['rating']}",
      category: "Fruits",
      image: "{fruit['image']}",
      relatedImages: [
        "{fruit['related'][0]}",
        "{fruit['related'][1]}",
        "{fruit['related'][2]}",
      ],
    ),
'''
        new_products += prod
        current_id += 1

repl = new_products + "  ];\n}"

with open(file_path, "w") as f:
    f.write(content.replace("  ];\n}", repl))

print("Injected new products!")
