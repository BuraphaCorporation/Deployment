
puts "add category"
{
  'entertainment': 'Entertainment',
  'art-and-culture': 'Art & Culture',
  'fitness-and-sport': 'Fitness & Sport',
}.map do |key, value|
  Category.find_or_create_by({name: key, title: value})
end

puts "add tag list"
['food', 'music', 'theatre', 'movies', 'bars', 'party', 'comedy', 'shows', 'live', 'beer', 'wine', 'drinks dance', 'dj', 'jazz', 'adventure', 'sports', 'fitness', 'festival', 'outdoors', 'gym', 'culture', 'performance', 'film', 'hipster', 'art', 'design', 'exhibition', 'photography', 'wellness', 'healthy', 'games', 'extreme', 'relaxing',
 'afterwork', 'family', 'date', 'romantic', 'group', 'popup', 'trip', 'workshop', 'class', 'training', 'single', 'night', 'day'].each do |tag|
  Tag.find_or_create_by({title: tag})
end


user = User.create do |user|
  user.email                  = "wadealike@gmail.com"
  user.first_name             = 'Bow'
  user.last_name              = 'Kai'
  user.password               = '1234567890'
  user.password_confirmation  = '1234567890'
  user.company                = 'WadeAlike'
  user.confirmed_at           = Time.zone.now
  user.role                   = 'admin'
end
puts user

user = User.create do |user|
  user.email                  = "organizer@wadealike.com"
  user.first_name             = 'Organizer'
  user.last_name              = 'WadeAlike'
  user.password               = '1234567890'
  user.password_confirmation  = '1234567890'
  user.company                = 'WadeAlike'
  user.confirmed_at           = Time.zone.now
  user.role                   = 'organizer'
end

puts "add new events"
Event.create([
  {
    slug: 'lazgam',
    user: user,
    status: :published,
    title: 'Lazgam เลเซอร์เกมส์ เกมแห่งการผจญภัยสุดมันส์ในโลกแห่งอนาคต',
    description: "LaZgaM ชวนคุณมาระเบิดความมันส์เปิดประสบการณ์แบบสุดขั้ว ณ ใจกลางกรุงเทพฯ กับ “เลเซอร์เกมส์” เกมการแข่งขันยิงปืนเลเซอร์ที่จะมาทำให้อะดรีนาลีนในตัวคุณพลุ่งพล่านอย่างสุดมันส์ คุณจะพบกับประสบการณ์ความมันส์หลากหลายรูปแบบผ่านโปรแกรมการร่วมสนุกที่ทางเราจัดทำขึ้น ในเขาวงกตที่ล้ำสมัยบรรยากาศเสมือนอยู่ในโลก Sci-Fi สนุก มันส์ และลึกลับไปพร้อมกัน

คุณสามารถจองสถานที่ผ่านทางเว็บไซต์เพื่อเข้าร่วมการต่อสู้เลเซอร์เกมส์ ทดสอบทักษะของตัวเองในการสู้รบกับผู้เล่นคนอื่นได้ พร้อมปรับเปลี่ยนโปรแกรมการร่วมสนุกจากด่านที่ง่ายสุดไปถึงด่านยากที่สุดได้ด้วยตัวเอง รวมไปถึงการจัดการแข่งขันทัวร์นาเม้นท์ครั้งใหญ่ กับ แก๊งเพื่อน, ครอบครัว หรือ บริษัทก็สามารถทำได้เช่นกัน

เพราะเลเซอร์เกมส์สามารถรองรับผู้เข้าแข่งขันได้ถึง 32 คน ในพื้นที่ 630 ตารางเมตร

เงื่อนไขการใช้บัตรจาก WadeAlike
- บัตร 1 ใบสามารถใช้เล่น Lazgam ได้ 1 session (15 นาที)
- กรุณาจอง session ล่วงหน้า ที่เว็บไซต์ของ Lazgam [BOOK] http://bookeo.com/lazgamlasergames
- คุณสามารถใช้บัตร ที่ซื้อจาก WadeAlike ได้ทุกวัน session ใดก็ได้ โดยสามารถใช้ได้ 1 ใบต่อวัน โดย session ต่อไปจะต้องชำระเงินกับ Lazgam ในราคาปกติ
- บัตรมีอายุ 90 วัน นับจากวันที่ซื้อ",
    location_name: 'Holiday Inns, 5th Floor, Sukhumvit 22',
    latitude: '13.733237',
    longitude: '100.563145'
  },
  {
    slug: 'give-me-soap',
    user: user,
    status: :published,
    title: 'Give Me Soap เวิร์คช็อปทำสบู่ของขวัญ',
    description: '"ในเดือนแห่งเทศกาลวันแม่แบบนี้ เราก็ต้องมาหาอะไรเป็นของขวัญสุดพิเศษให้คุณแม่กันเนาะ มาคราวนี้ Lailalin จะมา สอนทำสบู่ จากวัสดุธรรมชาติกัน แต่ไม่ใช่สบู่ธรรมดาแน่นอน เพราะว่ามาพร้อมกับรูปแบบ สีสัน สดใส สวยงาม เหมาะกับการทำเป็นของขวัญให้กับคนพิเศษ อย่างคุณแม่ ของเราสุดๆ เลยล่ะค่ะ

- สอนความรู้เบื้องต้นเกี่ยวกับ Soap Bases และวัตถุดิบ
- เทคนิคการทำและแก้ปัญหาในการทำส่วนผสม
- แหล่งขายวัตถุดิบอุปกรณ์ต่างๆ
- สาธิตการทำสบู่
- ลงมือทำสบู่ของขวัญ

วัสดุอุปกรณ์ และส่วนผสมในการทำสบู่:
- Soap Bases
- สี Mica สำหรับสบู่
- น้ำหอม
- แก้วบิกเกอร์และช้อนคน
- ของขวัญชิ้นเล็กๆ
- แม่พิมพ์สบู่
- เอกสารประกอบการทำสบู่

ผู้สอน:
คุณก้อย (สุชาดา สมประสงค์)  เจ้าของผลิตภัณฑ์สบู่และสกินแคร์โฮมเมด Lailalin Soap

สถานที่:
เดินทางสะดวก ห่างจาก BTS (ทางออกที่ 4) ประมาน 300 เมตร เข้ามาในซอยพหลโยธิน 6 เดินตรงเข้ามาจนสุดซอย จะเจอทางแยกให้เลี้ยวขวา แล้วเดินต่ออีกนิด ให้สังเกตขวามือไว้ บ้านชอปสปอท จะอยู่ทางขวามือ เลขที่ 68 กำแพงสีเทา (เยื้องกับอพาร์ตเมนท์)"',
    location_name: 'ShopSpot HQ, BTS อารีย์',
    latitude: '13.779055',
    longitude: '100.543927'
  },
  {
    slug: 'candle-aroma-perfume-workshop',
    user: user,
    status: :published,
    title: 'Candle Aroma Perfume Workshop สอนทำเทียนอโรมากลิ่นน้ำหอม',
    description: '"เรียนรู้วิธีทำเทียนอโรมา กลิ่นน้ำหอมจากวัสดุธรรมชาติ ที่พร้อมให้ทุกคนสนุกไปกับการเลือกสรรวัตถุดิบเพื่อให้เกิดเป็นเทียนกลิ่นหอมธรรมชาติไม่ซ้ำใคร

- เรียนรู้เกี่ยวกับกลิ่นต่างๆที่มาจาก aroma chemical
- เรียนรู้วิธีการทำเทียนอโรม่าอย่างละเอียด
- รู้จักประเภทและกรรรมวิธีสร้างกลิ่นน้ำหอมลงในเทียน
- เลือกกลิ่นน้ำหอม และผสมตามสูตรที่ออกแบบด้วยตัวเอง
- เรียนรู้กรรมวิธีการละลายแวกซ์ พร้อมกับเทคนิคการนำวัสดุธรรมชาติลงไปตกแต่งภายในก้อนเทียนให้เกิดความสวยงาม
- เทียนอโรมากลิ่นน้ำหอม ของตัวเอง บรรจุใส่ขวด ขนาด 100 กรัม กลับบ้านไปเป็นของขวัญให้คุณแม่และคนพิเศษได้เลย

วัสดุอุปกรณ์:
- ขวดแก้วเป็นภาชนะ ขวดใส่ เทียนหอมขนาด 100 กรัม
- Soy wax
- ไส้เทียน
- แท่งไม้
- บิกเกอร์
- เตาพกพา
- aroma chemical
- ดอกไม้และต้นพืชสมุนไพร สำหรับตกแต่งข้างขวด

ผู้สอน:
K. SHUN (NATURAL TELLER)

สถานที่
เดินทางสะดวก ห่างจาก BTS (ทางออกที่ 4) ประมาน 300 เมตร เข้ามาในซอยพหลโยธิน 6 เดินตรงเข้ามาจนสุดซอย จะเจอทางแยกให้เลี้ยวขวา แล้วเดินต่ออีกนิด ให้สังเกตขวามือไว้ บ้านชอปสปอท จะอยู่ทางขวามือ เลขที่ 68 กำแพงสีเทา (เยื้องกับอพาร์ตเมนท์) "',
    location_name: 'ShopSpot HQ, BTS อารีย์',
    latitude: '13.779055',
    longitude: '100.543927'
  },
  {
    slug: 'isan-connection-kammao-friends',
    user: user,
    status: :published,
    title: 'Isan Connection - Kammao & Friends',
    description: 'Once every 2 months with Kammao Perdtanon, the Phin player of The Paradise Bangkok Molam International Band, showcasing the traditional sounds & instruments of Isan, featuring a different guest & friends each time. This is a rare opportunity to experience authentic grass roots molam in the heart of the capital - don’t miss.',
    location_name: 'Studio Lam, Sukhumvit 51, Bangkok',
    latitude: '13.7263538',
    longitude: '100.5743194'
  },
  {
    slug: 'beam-x-zudrangma-maft-sai-dangdut-banget',
    user: user,
    status: :published,
    title: 'BEAM X ZUDRANGMA: Maft Sai / Dangdut Banget',
    description: "A very special night of music covering all bases from Roots to Electronics, from Africa, Latin America, & the Caribbean, to the Middle East & South East Asia. Maft Sai & Dangdut Banget will be digging deep into the crates, dropping a heavy, vinyl only selection! Boom!

DJ : MAFT SAI ( DJ, Producer, Records Store / Label & Bar Owner)
Maft Sai is the man behind the Zudrangma record label and a record store, which opened in 2007, specializing in Molam, Luk Thung & Thai Funk music. His pioneering work can be heard on his popular Zudrangma Vinyl & CD compilation releases as well at his live ""Paradise Bangkok"" and ""Isan Dancehall"" showcases.

He has been collecting records and DJing for over 15 years, spinning an eclectic mixture of Roots Luk Thung / Molam to Reggae, West African, Ethiopian, Far Eastern Psyche and underground sounds from around the world. He has also taken his showcases further afield, to Vietnam, Singapore, Hong Kong, Japan, Indonesia, India, Switzerland, Austria, UK, Germany, France, Belgium, Sweden, Denmark, Poland, Romania, Netherlands and Spain. As well as dropping his dj set in festival such as Glastonbury Festival, Fusion Festival, Wax Treatment, Off Festival and many more. He has also appeared as a dj on radio shows such as: ""BBC 6"", ""Worldwide Radio"" by Gilles Peterson & ""NTS Radio"" (London), “Beat in Space Radio Show” by Tim Sweeney (New York), “Dublab Radio” by Frosty (L.A.), “Pirates Choice Radio” (Osaka) “Northwave Radio” (Hokkaido) and many more.

He has also co-curated collections of left-field Thai music with Chris Menist for Finders Keepers Records “Thai? Dai! The Heavier Side Of The Luk Thung Underground”, for Soundway Records “The Sound Of Siam: Leftfield Luk Thung, Jazz & Molam 1964 - 1975 Vol.1 & 2. Maft and Chris also run the record label 'Paradise Bangkok', which reissues underground vinyl gems from around the world. They also formed and play in 'The Paradise Bangkok Molam International Band' which is a one of a kind group, to perform vintage molam, with 21st Century vibes. The blend of Isan musicianship, powered by one of Bangkok's funkiest rhythm sections, which made its live debut in 2012, has already garnered the band praises and invitations to play at festivals & venues all over Europe and the world.

Currently he is working in a project ""Studio Lam"" a performance space, bar and records label with the aim of providing a home for creative new music of Thailand that exists outside of the mainstream.

Recent Mixes
Gilles Peterson Worldwide : https://soundcloud.com/gillespetersonworldwide/the-paradise-bangkok-molam-international-band-mix-on-gilles-peterson-worldwide-gpww961
NTS Radio : http://www.ntslive.co.uk/shows/spacebass/episodes/spacebass-w-ld-ldldn-15th-august-2015
BBC6 : http://www.bbc.co.uk/programmes/b0647wv0",
    location_name: 'BEAM X ZUDRANGMA',
    latitude: '13.7563309',
    longitude: '100.50176510000006'
  },
  {
    slug: 'watercolor-realistic-flowers',
    user: user,
    status: :published,
    title: 'คลาส “สีน้ำสุดตระการตา” Watercolor Realistic Flowers',
    description: "เวิร์คช็อปวาดดอกไม้เสมือนจริงด้วยเทคนิคสีน้ำ เรียนรู้เทคนิคการร่างภาพดอกไม้จากแบบจริง และลงสีด้วยเทคนิคสีน้ำที่สุดงดงามโรแมนติก

สอนโดย Navin Tan อาจารย์ศิลปะและศิลปินสีน้ำดาวรุ่งที่มีผลงานแสดงมาแล้วมากมายทั้งในและต่างประเทศ ล่าสุดได้รับรางวัลชมเชยจากการเข้าร่วมประกวดสีน้ำนานาชาติ ณ ประเทศปากีสถาน

รวมอุปกรณ์ทุกอย่างให้นำไปฝึกต่อที่บ้านได้
สถานที่ เอกมัย ซอย 10 ตรงเว้งโบราณ ชั้น 3 ข้างๆ ร้านบ้านเพื่อน
แนะนำให้เดินทางด้วยรถไฟฟ้าหรือแท็กซี่ เพราะค่าที่จอดรถแพงมาก (100-200 บาท สำหรับ 1 วันเต็ม)",
    location_name: 'Olive Creative Laboratory, Ekkamai 10',
    latitude: '13.7294212',
    longitude: '100.584347'
  }
]) if Category.exists?

lazgam    = Event.friendly.find('lazgam')
shopspot1 = Event.friendly.find('give-me-soap')
shopspot2 = Event.friendly.find('candle-aroma-perfume-workshop')
studiolam = Event.friendly.find('isan-connection-kammao-friends')
beam      = Event.friendly.find('beam-x-zudrangma-maft-sai-dangdut-banget')
olive     = Event.friendly.find('watercolor-realistic-flowers')


# 'entertainment': 'Entertainment',
# 'art-and-culture': 'Art & Culture',
# 'fitness-and-sport': 'Fitness & Sport',


puts "categories"
CategoriesEvent.create(event: lazgam, category: Category.find_by_name('fitness-and-sport'))
CategoriesEvent.create(event: shopspot1, category: Category.find_by_name('art-and-culture'))
CategoriesEvent.create(event: shopspot2, category: Category.find_by_name('art-and-culture'))
CategoriesEvent.create(event: studiolam, category: Category.find_by_name('entertainment'))
CategoriesEvent.create(event: beam, category: Category.find_by_name('entertainment'))
CategoriesEvent.create(event: olive, category: Category.find_by_name('art-and-culture'))


puts "update sections"
beam.sections.create([
  {
    title:      "General",
    event_time: Time.zone.now + rand(5..30).days,
    end_time:   Time.zone.now + rand(5..30).days,
    price:      1000,
    total:      100,
    bought:     0
  },
  {
    title:      "VIP",
    event_time: Time.zone.now + rand(5..30).days,
    end_time:   Time.zone.now + rand(5..30).days,
    price:      4500,
    total:      100,
    bought:     0
  }
  #,
  # {
  #   title:      "General",
  #   event_time: Time.zone.tomorrow,
  #   end_time:   Time.zone.tomorrow,
  #   price:      1000,
  #   total:      100,
  #   bought:     0
  # },
  # {
  #   title:      "VIP",
  #   event_time: Time.zone.tomorrow,
  #   end_time:   Time.zone.tomorrow,
  #   price:      4500,
  #   total:      100,
  #   bought:     0
  # },
  # {
  #   title:      "General",
  #   event_time: Time.zone.tomorrow + 1.days,
  #   end_time:   Time.zone.tomorrow + 1.days,
  #   price:      1000,
  #   total:      100,
  #   bought:     0
  # },
  # {
  #   title:      "VIP",
  #   event_time: Time.zone.tomorrow + 1.days,
  #   end_time:   Time.zone.tomorrow + 1.days,
  #   price:      4500,
  #   total:      100,
  #   bought:     0
  # },
  # {
  #   title:      "General",
  #   event_time: Time.zone.tomorrow + 2.days,
  #   end_time:   Time.zone.tomorrow + 2.days,
  #   price:      1000,
  #   total:      100,
  #   bought:     0
  # },
  # {
  #   title:      "VIP",
  #   event_time: Time.zone.tomorrow + 2.days,
  #   end_time:   Time.zone.tomorrow + 2.days,
  #   price:      4500,
  #   total:      100,
  #   bought:     0
  # },
  # {
  #   title:      "General",
  #   event_time: Time.zone.tomorrow + 3.days,
  #   end_time:   Time.zone.tomorrow + 3.days,
  #   price:      1000,
  #   total:      100,
  #   bought:     0
  # },
  # {
  #   title:      "VIP",
  #   event_time: Time.zone.tomorrow + 3.days,
  #   end_time:   Time.zone.tomorrow + 3.days,
  #   price:      4500,
  #   total:      100,
  #   bought:     0
  # },
  # {
  #   title:      "General",
  #   event_time: Time.zone.tomorrow + 4.days,
  #   end_time:   Time.zone.tomorrow + 4.days,
  #   price:      1000,
  #   total:      100,
  #   bought:     0
  # },
  # {
  #   title:      "VIP",
  #   event_time: Time.zone.tomorrow + 4.days,
  #   end_time:   Time.zone.tomorrow + 4.days,
  #   price:      4500,
  #   total:      100,
  #   bought:     0
  # },
  # {
  #   title:      "General",
  #   event_time: Time.zone.now + rand(5..30).days + 30.days,
  #   end_time:   Time.zone.now + rand(5..30).days + 30.days,
  #   price:      1000,
  #   total:      100,
  #   bought:     0
  # },
  # {
  #   title:      "VIP",
  #   event_time: Time.zone.now + rand(5..30).days + 30.days,
  #   end_time:   Time.zone.now + rand(5..30).days + 30.days,
  #   price:      4500,
  #   total:      100,
  #   bought:     0
  # }
])

shopspot1.sections.create([
  {
    title:      "General",
    event_time: Time.zone.now + rand(5..30).days,
    end_time:   Time.zone.now + rand(5..30).days,
    price:      1720,
    total:      12,
    bought:     0
  }
  # {
  #   title:      "VIP",
  #   event_time: Time.zone.now + rand(5..30).days,
  #   end_time:   Time.zone.now + rand(5..30).days,
  #   price:      10000,
  #   total:      100,
  #   bought:     0
  # }
])

shopspot2.sections.create([
  {
    title:      "General",
    event_time: Time.zone.now + rand(5..30).days,
    end_time:   Time.zone.now + rand(5..30).days,
    price:      1630,
    total:      15,
    bought:     0
  }
  # ,
  # {
  #   title:      "General",
  #   event_time: Time.zone.now + rand(5..30).days,
  #   end_time:   Time.zone.now + rand(5..30).days,
  #   price:      12000,
  #   total:      100,
  #   bought:     0
  # }
])

studiolam.sections.create([
  {
    title:      "General",
    event_time: Time.zone.now + rand(5..30).days,
    end_time:   Time.zone.now + rand(5..30).days,
    price:      500,
    total:      100,
    bought:     0
  }
  # ,
  # {
  #   title:      "VIP",
  #   event_time: Time.zone.now + rand(5..30).days,
  #   end_time:   Time.zone.now + rand(5..30).days,
  #   price:      2000,
  #   total:      100,
  #   bought:     0
  # }
])

lazgam.sections.create([
  {
    title:      "General",
    event_time: Time.zone.now + rand(5..30).days,
    end_time:   Time.zone.now + rand(5..30).days,
    price:      1000,
    total:      100,
    bought:     0
  }
  # {
  #   title:      "General",
  #   event_time: Time.zone.now + rand(5..30).days,
  #   end_time:   Time.zone.now + rand(5..30).days,
  #   price:      1000,
  #   total:      100,
  #   bought:     0
  # }
])

olive.sections.create([
  {
    title:      "General",
    event_time: Time.zone.now + rand(5..30).days,
    end_time:   Time.zone.now + rand(5..30).days,
    price:      2800,
    total:      12,
    bought:     0
  }
  # ,
  # {
  #   title:      "General",
  #   event_time: Time.zone.now + rand(5..30).days,
  #   end_time:   Time.zone.now + rand(5..30).days,
  #   price:      1000,
  #   total:      100,
  #   bought:     0
  # }
])


puts "upload image"
Dir["#{Rails.root}/public/event_content/lazgam/*"].each_with_index do |attachment, index|
  puts attachment
  EventPicture.create(event: lazgam, media: File.open(attachment, 'rb'))
  if index == 0
    lazgam.update(cover: File.open(attachment, 'rb'))
  end
end

Dir["#{Rails.root}/public/event_content/shopspot/Candle Aroma Perfume/*"].each_with_index do |attachment, index|
  puts attachment
  EventPicture.create(event: shopspot1, media: File.open(attachment, 'rb'))
  if index == 0
    shopspot1.update(cover: File.open(attachment, 'rb'))
  end
end

Dir["#{Rails.root}/public/event_content/shopspot/Give Me Soap/*"].each_with_index do |attachment, index|
  puts attachment
  EventPicture.create(event: shopspot2, media: File.open(attachment, 'rb'))
  if index == 0
    shopspot2.update(cover: File.open(attachment, 'rb'))
  end
end

Dir["#{Rails.root}/public/event_content/studiolam/*"].each_with_index do |attachment, index|
  puts attachment
  EventPicture.create(event: studiolam, media: File.open(attachment, 'rb'))
  if index == 0
    studiolam.update(cover: File.open(attachment, 'rb'))
  end
end

Dir["#{Rails.root}/public/event_content/beam/*"].each_with_index do |attachment, index|
  puts attachment
  EventPicture.create(event: beam, media: File.open(attachment, 'rb'))
  if index == 0
    beam.update(cover: File.open(attachment, 'rb'))
  end
end

Dir["#{Rails.root}/public/event_content/olive/*"].each_with_index do |attachment, index|
  puts attachment
  EventPicture.create(event: olive, media: File.open(attachment, 'rb'))
  if index == 0
    olive.update(cover: File.open(attachment, 'rb'))
  end
end

puts "update event uptime"
Event.update_uptime_present
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
