
// generated with FlatBuffersSchemaEditor https://github.com/mzaks/FlatBuffersSchemaEditor

import FlatBuffersSwift
public final class ContactList {
	public var lastModified : Int64 = 0
	public var entries : [Contact?] = []
	public init(){}
	public init(lastModified: Int64, entries: [Contact?]){
		self.lastModified = lastModified
		self.entries = entries
	}
}
public extension ContactList {
	private static func create(reader : FlatBufferReader, objectOffset : Offset?) -> ContactList? {
		guard let objectOffset = objectOffset else {
			return nil
		}
		if reader.config.uniqueTables {
			if let o = reader.objectPool[objectOffset]{
				return o as? ContactList
			}
		}
		let _result = ContactList()
		if reader.config.uniqueTables {
			reader.objectPool[objectOffset] = _result
		}
		_result.lastModified = reader.get(objectOffset, propertyIndex: 0, defaultValue: 0)
		let offset_entries : Offset? = reader.getOffset(objectOffset, propertyIndex: 1)
		let length_entries = reader.getVectorLength(offset_entries)
		if(length_entries > 0){
			var index = 0
			_result.entries.reserveCapacity(length_entries)
			while index < length_entries {
				_result.entries.append(Contact.create(reader, objectOffset: reader.getVectorOffsetElement(offset_entries!, index: index)))
				index += 1
			}
		}
		return _result
	}
}
public extension ContactList {
	public static func fromByteArray(data : UnsafeBufferPointer<UInt8>, config : BinaryReadConfig = BinaryReadConfig()) -> ContactList {
		let reader = FlatBufferReader.create(data, config: config)
		let objectOffset = reader.rootObjectOffset
		let result = create(reader, objectOffset : objectOffset)!
		FlatBufferReader.reuse(reader)
		return result
	}
}
public extension ContactList {
	public func toByteArray (config : BinaryBuildConfig = BinaryBuildConfig()) -> [UInt8] {
		let builder = FlatBufferBuilder.create(config)
		let offset = addToByteArray(builder)
		performLateBindings(builder)
		let result = try! builder.finish(offset, fileIdentifier: nil)
		FlatBufferBuilder.reuse(builder)
		return result
	}
}
public extension ContactList {
	public final class LazyAccess : Hashable {
		private let _reader : FlatBufferReader!
		private let _objectOffset : Offset!
		public init(data : UnsafeBufferPointer<UInt8>, config : BinaryReadConfig = BinaryReadConfig()){
			_reader = FlatBufferReader.create(data, config: config)
			_objectOffset = _reader.rootObjectOffset
		}
		deinit{
			FlatBufferReader.reuse(_reader)
		}
		public var data : [UInt8] {
			return _reader.data
		}
		private init?(reader : FlatBufferReader, objectOffset : Offset?){
			guard let objectOffset = objectOffset else {
				_reader = nil
				_objectOffset = nil
				return nil
			}
			_reader = reader
			_objectOffset = objectOffset
		}

		public var lastModified : Int64 { 
			get { return _reader.get(_objectOffset, propertyIndex: 0, defaultValue:0)}
			set { try!_reader.set(_objectOffset, propertyIndex: 0, value: newValue)}
		}
		public lazy var entries : LazyVector<Contact.LazyAccess> = { [self]
			let vectorOffset : Offset? = self._reader.getOffset(self._objectOffset, propertyIndex: 1)
			let vectorLength = self._reader.getVectorLength(vectorOffset)
			let reader = self._reader
			return LazyVector(count: vectorLength){ [reader] in
				Contact.LazyAccess(reader: reader, objectOffset : reader.getVectorOffsetElement(vectorOffset!, index: $0))
			}
		}()

		public var createEagerVersion : ContactList? { return ContactList.create(_reader, objectOffset: _objectOffset) }
		
		public var hashValue: Int { return Int(_objectOffset) }
	}
}

public func ==(t1 : ContactList.LazyAccess, t2 : ContactList.LazyAccess) -> Bool {
	return t1._objectOffset == t2._objectOffset && t1._reader === t2._reader
}

public extension ContactList {
	private func addToByteArray(builder : FlatBufferBuilder) -> Offset {
		if builder.config.uniqueTables {
			if let myOffset = builder.cache[ObjectIdentifier(self)] {
				return myOffset
			}
		}
		var offset1 = Offset(0)
		if entries.count > 0{
			var offsets = [Offset?](count: entries.count, repeatedValue: nil)
			var index = entries.count - 1
			while(index >= 0){
				offsets[index] = entries[index]?.addToByteArray(builder)
				index -= 1
			}
			try! builder.startVector(entries.count)
			index = entries.count - 1
			while(index >= 0){
				try! builder.putOffset(offsets[index])
				index -= 1
			}
			offset1 = builder.endVector()
		}
		try! builder.openObject(2)
		if entries.count > 0 {
			try! builder.addPropertyOffsetToOpenObject(1, offset: offset1)
		}
		try! builder.addPropertyToOpenObject(0, value : lastModified, defaultValue : 0)
		let myOffset =  try! builder.closeObject()
		if builder.config.uniqueTables {
			builder.cache[ObjectIdentifier(self)] = myOffset
		}
		return myOffset
	}
}
public enum Gender : Int8 {
	case None, Male, Female
}
public enum Mood : Int8 {
	case Funny, Serious, Angry, Humble
}
public final class Contact {
	public var name : String? = nil
	public var birthday : Date? = nil
	public var gender : Gender? = Gender.None
	public var tags : [String?] = []
	public var addressEntries : [AddressEntry?] = []
	public var currentLoccation : GeoLocation? = nil
	public var previousLocations : [GeoLocation?] = []
	public var moods : [Mood?] = []
	public init(){}
	public init(name: String?, birthday: Date?, gender: Gender?, tags: [String?], addressEntries: [AddressEntry?], currentLoccation: GeoLocation?, previousLocations: [GeoLocation?], moods: [Mood?]){
		self.name = name
		self.birthday = birthday
		self.gender = gender
		self.tags = tags
		self.addressEntries = addressEntries
		self.currentLoccation = currentLoccation
		self.previousLocations = previousLocations
		self.moods = moods
	}
}
public extension Contact {
	private static func create(reader : FlatBufferReader, objectOffset : Offset?) -> Contact? {
		guard let objectOffset = objectOffset else {
			return nil
		}
		if reader.config.uniqueTables {
			if let o = reader.objectPool[objectOffset]{
				return o as? Contact
			}
		}
		let _result = Contact()
		if reader.config.uniqueTables {
			reader.objectPool[objectOffset] = _result
		}
		_result.name = reader.getString(reader.getOffset(objectOffset, propertyIndex: 0))
		_result.birthday = Date.create(reader, objectOffset: reader.getOffset(objectOffset, propertyIndex: 1))
		_result.gender = Gender(rawValue: reader.get(objectOffset, propertyIndex: 2, defaultValue: Gender.None.rawValue))
		let offset_tags : Offset? = reader.getOffset(objectOffset, propertyIndex: 3)
		let length_tags = reader.getVectorLength(offset_tags)
		if(length_tags > 0){
			var index = 0
			_result.tags.reserveCapacity(length_tags)
			while index < length_tags {
				_result.tags.append(reader.getString(reader.getVectorOffsetElement(offset_tags!, index: index)))
				index += 1
			}
		}
		let offset_addressEntries : Offset? = reader.getOffset(objectOffset, propertyIndex: 4)
		let length_addressEntries = reader.getVectorLength(offset_addressEntries)
		if(length_addressEntries > 0){
			var index = 0
			_result.addressEntries.reserveCapacity(length_addressEntries)
			while index < length_addressEntries {
				_result.addressEntries.append(AddressEntry.create(reader, objectOffset: reader.getVectorOffsetElement(offset_addressEntries!, index: index)))
				index += 1
			}
		}
		_result.currentLoccation = reader.get(objectOffset, propertyIndex: 5)
		let offset_previousLocations : Offset? = reader.getOffset(objectOffset, propertyIndex: 6)
		let length_previousLocations = reader.getVectorLength(offset_previousLocations)
		if(length_previousLocations > 0){
			var index = 0
			_result.previousLocations.reserveCapacity(length_previousLocations)
			while index < length_previousLocations {
				_result.previousLocations.append(reader.getVectorScalarElement(offset_previousLocations!, index: index) as GeoLocation
				)
				index += 1
			}
		}
		let offset_moods : Offset? = reader.getOffset(objectOffset, propertyIndex: 7)
		let length_moods = reader.getVectorLength(offset_moods)
		if(length_moods > 0){
			var index = 0
			_result.moods.reserveCapacity(length_moods)
			while index < length_moods {
				_result.moods.append(Mood(rawValue: reader.getVectorScalarElement(offset_moods!, index: index)))
				index += 1
			}
		}
		return _result
	}
}
public extension Contact {
	public final class LazyAccess : Hashable {
		private let _reader : FlatBufferReader!
		private let _objectOffset : Offset!
		private init?(reader : FlatBufferReader, objectOffset : Offset?){
			guard let objectOffset = objectOffset else {
				_reader = nil
				_objectOffset = nil
				return nil
			}
			_reader = reader
			_objectOffset = objectOffset
		}

		public lazy var name : String? = self._reader.getString(self._reader.getOffset(self._objectOffset, propertyIndex: 0))
		public lazy var birthday : Date.LazyAccess? = Date.LazyAccess(reader: self._reader, objectOffset : self._reader.getOffset(self._objectOffset, propertyIndex: 1))
		public var gender : Gender? { 
			get { return Gender(rawValue: _reader.get(self._objectOffset, propertyIndex: 2, defaultValue:Gender.None.rawValue))}
			set { 
				if let value = newValue{
					try!_reader.set(_objectOffset, propertyIndex: 2, value: value.rawValue)
				}
			}
		}
		public lazy var tags : LazyVector<String> = { [self]
			let vectorOffset : Offset? = self._reader.getOffset(self._objectOffset, propertyIndex: 3)
			let vectorLength = self._reader.getVectorLength(vectorOffset)
			let reader = self._reader
			return LazyVector(count: vectorLength){ [reader] in
				reader.getString(reader.getVectorOffsetElement(vectorOffset!, index: $0))
			}
		}()
		public lazy var addressEntries : LazyVector<AddressEntry.LazyAccess> = { [self]
			let vectorOffset : Offset? = self._reader.getOffset(self._objectOffset, propertyIndex: 4)
			let vectorLength = self._reader.getVectorLength(vectorOffset)
			let reader = self._reader
			return LazyVector(count: vectorLength){ [reader] in
				AddressEntry.LazyAccess(reader: reader, objectOffset : reader.getVectorOffsetElement(vectorOffset!, index: $0))
			}
		}()
		public var currentLoccation : GeoLocation? { 
			get { return self._reader.get(_objectOffset, propertyIndex: 5)}
			set {
				if let value = newValue{
					try!_reader.set(_objectOffset, propertyIndex: 5, value: value)
				}
			}
		}
		public lazy var previousLocations : LazyVector<GeoLocation> = { [self]
			let vectorOffset : Offset? = self._reader.getOffset(self._objectOffset, propertyIndex: 6)
			let vectorLength = self._reader.getVectorLength(vectorOffset)
			let reader = self._reader
			return LazyVector(count: vectorLength, { [reader] in
				reader.getVectorScalarElement(vectorOffset!, index: $0) as GeoLocation
			}) { [reader] in
				reader.setVectorScalarElement(vectorOffset!, index: $0, value: $1)
			}
		}()
		public lazy var moods : LazyVector<Mood> = { [self]
			let vectorOffset : Offset? = self._reader.getOffset(self._objectOffset, propertyIndex: 7)
			let vectorLength = self._reader.getVectorLength(vectorOffset)
			let reader = self._reader
			return LazyVector(count: vectorLength, { [reader] in
				Mood(rawValue: reader.getVectorScalarElement(vectorOffset!, index: $0))
			}) { [reader] in
				reader.setVectorScalarElement(vectorOffset!, index: $0, value: $1.rawValue)
			}
		}()

		public var createEagerVersion : Contact? { return Contact.create(_reader, objectOffset: _objectOffset) }
		
		public var hashValue: Int { return Int(_objectOffset) }
	}
}

public func ==(t1 : Contact.LazyAccess, t2 : Contact.LazyAccess) -> Bool {
	return t1._objectOffset == t2._objectOffset && t1._reader === t2._reader
}

public extension Contact {
	private func addToByteArray(builder : FlatBufferBuilder) -> Offset {
		if builder.config.uniqueTables {
			if let myOffset = builder.cache[ObjectIdentifier(self)] {
				return myOffset
			}
		}
		var offset7 = Offset(0)
		if moods.count > 0{
			try! builder.startVector(moods.count)
			var index = moods.count - 1
			while(index >= 0){
				builder.put(moods[index]!.rawValue)
				index -= 1
			}
			offset7 = builder.endVector()
		}
		var offset6 = Offset(0)
		if previousLocations.count > 0{
			try! builder.startVector(previousLocations.count)
			var index = previousLocations.count - 1
			while(index >= 0){
				builder.put(previousLocations[index]!)
				index -= 1
			}
			offset6 = builder.endVector()
		}
		var offset4 = Offset(0)
		if addressEntries.count > 0{
			var offsets = [Offset?](count: addressEntries.count, repeatedValue: nil)
			var index = addressEntries.count - 1
			while(index >= 0){
				offsets[index] = addressEntries[index]?.addToByteArray(builder)
				index -= 1
			}
			try! builder.startVector(addressEntries.count)
			index = addressEntries.count - 1
			while(index >= 0){
				try! builder.putOffset(offsets[index])
				index -= 1
			}
			offset4 = builder.endVector()
		}
		var offset3 = Offset(0)
		if tags.count > 0{
			var offsets = [Offset?](count: tags.count, repeatedValue: nil)
			var index = tags.count - 1
			while(index >= 0){
				offsets[index] = try!builder.createString(tags[index])
				index -= 1
			}
			try! builder.startVector(tags.count)
			index = tags.count - 1
			while(index >= 0){
				try! builder.putOffset(offsets[index])
				index -= 1
			}
			offset3 = builder.endVector()
		}
		let offset1 = birthday?.addToByteArray(builder) ?? 0
		let offset0 = try! builder.createString(name)
		try! builder.openObject(8)
		if moods.count > 0 {
			try! builder.addPropertyOffsetToOpenObject(7, offset: offset7)
		}
		if previousLocations.count > 0 {
			try! builder.addPropertyOffsetToOpenObject(6, offset: offset6)
		}
		if let currentLoccation = currentLoccation {
			builder.put(currentLoccation)
			try! builder.addCurrentOffsetAsPropertyToOpenObject(5)
		}
		if addressEntries.count > 0 {
			try! builder.addPropertyOffsetToOpenObject(4, offset: offset4)
		}
		if tags.count > 0 {
			try! builder.addPropertyOffsetToOpenObject(3, offset: offset3)
		}
		try! builder.addPropertyToOpenObject(2, value : gender!.rawValue, defaultValue : 0)
		if birthday != nil {
			try! builder.addPropertyOffsetToOpenObject(1, offset: offset1)
		}
		try! builder.addPropertyOffsetToOpenObject(0, offset: offset0)
		let myOffset =  try! builder.closeObject()
		if builder.config.uniqueTables {
			builder.cache[ObjectIdentifier(self)] = myOffset
		}
		return myOffset
	}
}
public final class Date {
	public var day : Int8 = 0
	public var month : Int8 = 0
	public var year : Int16 = 0
	public init(){}
	public init(day: Int8, month: Int8, year: Int16){
		self.day = day
		self.month = month
		self.year = year
	}
}
public extension Date {
	private static func create(reader : FlatBufferReader, objectOffset : Offset?) -> Date? {
		guard let objectOffset = objectOffset else {
			return nil
		}
		if reader.config.uniqueTables {
			if let o = reader.objectPool[objectOffset]{
				return o as? Date
			}
		}
		let _result = Date()
		if reader.config.uniqueTables {
			reader.objectPool[objectOffset] = _result
		}
		_result.day = reader.get(objectOffset, propertyIndex: 0, defaultValue: 0)
		_result.month = reader.get(objectOffset, propertyIndex: 1, defaultValue: 0)
		_result.year = reader.get(objectOffset, propertyIndex: 2, defaultValue: 0)
		return _result
	}
}
public extension Date {
	public final class LazyAccess : Hashable {
		private let _reader : FlatBufferReader!
		private let _objectOffset : Offset!
		private init?(reader : FlatBufferReader, objectOffset : Offset?){
			guard let objectOffset = objectOffset else {
				_reader = nil
				_objectOffset = nil
				return nil
			}
			_reader = reader
			_objectOffset = objectOffset
		}

		public var day : Int8 { 
			get { return _reader.get(_objectOffset, propertyIndex: 0, defaultValue:0)}
			set { try!_reader.set(_objectOffset, propertyIndex: 0, value: newValue)}
		}
		public var month : Int8 { 
			get { return _reader.get(_objectOffset, propertyIndex: 1, defaultValue:0)}
			set { try!_reader.set(_objectOffset, propertyIndex: 1, value: newValue)}
		}
		public var year : Int16 { 
			get { return _reader.get(_objectOffset, propertyIndex: 2, defaultValue:0)}
			set { try!_reader.set(_objectOffset, propertyIndex: 2, value: newValue)}
		}

		public var createEagerVersion : Date? { return Date.create(_reader, objectOffset: _objectOffset) }
		
		public var hashValue: Int { return Int(_objectOffset) }
	}
}

public func ==(t1 : Date.LazyAccess, t2 : Date.LazyAccess) -> Bool {
	return t1._objectOffset == t2._objectOffset && t1._reader === t2._reader
}

public extension Date {
	private func addToByteArray(builder : FlatBufferBuilder) -> Offset {
		if builder.config.uniqueTables {
			if let myOffset = builder.cache[ObjectIdentifier(self)] {
				return myOffset
			}
		}
		try! builder.openObject(3)
		try! builder.addPropertyToOpenObject(2, value : year, defaultValue : 0)
		try! builder.addPropertyToOpenObject(1, value : month, defaultValue : 0)
		try! builder.addPropertyToOpenObject(0, value : day, defaultValue : 0)
		let myOffset =  try! builder.closeObject()
		if builder.config.uniqueTables {
			builder.cache[ObjectIdentifier(self)] = myOffset
		}
		return myOffset
	}
}
public struct S1 : Scalar {
	public let i : Int32
}
public func ==(v1:S1, v2:S1) -> Bool {
	return  v1.i==v2.i
}
public struct GeoLocation : Scalar {
	public let latitude : Float64
	public let longitude : Float64
	public let elevation : Float32
	public let s : S1
}
public func ==(v1:GeoLocation, v2:GeoLocation) -> Bool {
	return  v1.latitude==v2.latitude &&  v1.longitude==v2.longitude &&  v1.elevation==v2.elevation &&  v1.s==v2.s
}
public final class AddressEntry {
	public var order : Int32 = 0
	public var address : Address? = nil
	public init(){}
	public init(order: Int32, address: Address?){
		self.order = order
		self.address = address
	}
}
public extension AddressEntry {
	private static func create(reader : FlatBufferReader, objectOffset : Offset?) -> AddressEntry? {
		guard let objectOffset = objectOffset else {
			return nil
		}
		if reader.config.uniqueTables {
			if let o = reader.objectPool[objectOffset]{
				return o as? AddressEntry
			}
		}
		let _result = AddressEntry()
		if reader.config.uniqueTables {
			reader.objectPool[objectOffset] = _result
		}
		_result.order = reader.get(objectOffset, propertyIndex: 0, defaultValue: 0)
		_result.address = create_Address(reader, propertyIndex: 1, objectOffset: objectOffset)
		return _result
	}
}
public extension AddressEntry {
	public final class LazyAccess : Hashable {
		private let _reader : FlatBufferReader!
		private let _objectOffset : Offset!
		private init?(reader : FlatBufferReader, objectOffset : Offset?){
			guard let objectOffset = objectOffset else {
				_reader = nil
				_objectOffset = nil
				return nil
			}
			_reader = reader
			_objectOffset = objectOffset
		}

		public var order : Int32 { 
			get { return _reader.get(_objectOffset, propertyIndex: 0, defaultValue:0)}
			set { try!_reader.set(_objectOffset, propertyIndex: 0, value: newValue)}
		}
		public lazy var address : Address_LazyAccess? = create_Address_LazyAccess(self._reader, propertyIndex: 1, objectOffset: self._objectOffset)

		public var createEagerVersion : AddressEntry? { return AddressEntry.create(_reader, objectOffset: _objectOffset) }
		
		public var hashValue: Int { return Int(_objectOffset) }
	}
}

public func ==(t1 : AddressEntry.LazyAccess, t2 : AddressEntry.LazyAccess) -> Bool {
	return t1._objectOffset == t2._objectOffset && t1._reader === t2._reader
}

public extension AddressEntry {
	private func addToByteArray(builder : FlatBufferBuilder) -> Offset {
		if builder.config.uniqueTables {
			if let myOffset = builder.cache[ObjectIdentifier(self)] {
				return myOffset
			}
		}
		let offset1 = addToByteArray_Address(builder, union: address)
		try! builder.openObject(3)
		if address != nil {
			try! builder.addPropertyOffsetToOpenObject(2, offset: offset1)
			try! builder.addPropertyToOpenObject(1, value : unionCase_Address(address), defaultValue : 0)
		}
		try! builder.addPropertyToOpenObject(0, value : order, defaultValue : 0)
		let myOffset =  try! builder.closeObject()
		if builder.config.uniqueTables {
			builder.cache[ObjectIdentifier(self)] = myOffset
		}
		return myOffset
	}
}
public final class PostalAddress {
	public var country : String? = nil
	public var city : String? = nil
	public var postalCode : Int32 = 0
	public var streetAndNumber : String? = nil
	public init(){}
	public init(country: String?, city: String?, postalCode: Int32, streetAndNumber: String?){
		self.country = country
		self.city = city
		self.postalCode = postalCode
		self.streetAndNumber = streetAndNumber
	}
}
public extension PostalAddress {
	private static func create(reader : FlatBufferReader, objectOffset : Offset?) -> PostalAddress? {
		guard let objectOffset = objectOffset else {
			return nil
		}
		if reader.config.uniqueTables {
			if let o = reader.objectPool[objectOffset]{
				return o as? PostalAddress
			}
		}
		let _result = PostalAddress()
		if reader.config.uniqueTables {
			reader.objectPool[objectOffset] = _result
		}
		_result.country = reader.getString(reader.getOffset(objectOffset, propertyIndex: 0))
		_result.city = reader.getString(reader.getOffset(objectOffset, propertyIndex: 1))
		_result.postalCode = reader.get(objectOffset, propertyIndex: 2, defaultValue: 0)
		_result.streetAndNumber = reader.getString(reader.getOffset(objectOffset, propertyIndex: 3))
		return _result
	}
}
public extension PostalAddress {
	public final class LazyAccess : Hashable {
		private let _reader : FlatBufferReader!
		private let _objectOffset : Offset!
		private init?(reader : FlatBufferReader, objectOffset : Offset?){
			guard let objectOffset = objectOffset else {
				_reader = nil
				_objectOffset = nil
				return nil
			}
			_reader = reader
			_objectOffset = objectOffset
		}

		public lazy var country : String? = self._reader.getString(self._reader.getOffset(self._objectOffset, propertyIndex: 0))
		public lazy var city : String? = self._reader.getString(self._reader.getOffset(self._objectOffset, propertyIndex: 1))
		public var postalCode : Int32 { 
			get { return _reader.get(_objectOffset, propertyIndex: 2, defaultValue:0)}
			set { try!_reader.set(_objectOffset, propertyIndex: 2, value: newValue)}
		}
		public lazy var streetAndNumber : String? = self._reader.getString(self._reader.getOffset(self._objectOffset, propertyIndex: 3))

		public var createEagerVersion : PostalAddress? { return PostalAddress.create(_reader, objectOffset: _objectOffset) }
		
		public var hashValue: Int { return Int(_objectOffset) }
	}
}

public func ==(t1 : PostalAddress.LazyAccess, t2 : PostalAddress.LazyAccess) -> Bool {
	return t1._objectOffset == t2._objectOffset && t1._reader === t2._reader
}

public extension PostalAddress {
	private func addToByteArray(builder : FlatBufferBuilder) -> Offset {
		if builder.config.uniqueTables {
			if let myOffset = builder.cache[ObjectIdentifier(self)] {
				return myOffset
			}
		}
		let offset3 = try! builder.createString(streetAndNumber)
		let offset1 = try! builder.createString(city)
		let offset0 = try! builder.createString(country)
		try! builder.openObject(4)
		try! builder.addPropertyOffsetToOpenObject(3, offset: offset3)
		try! builder.addPropertyToOpenObject(2, value : postalCode, defaultValue : 0)
		try! builder.addPropertyOffsetToOpenObject(1, offset: offset1)
		try! builder.addPropertyOffsetToOpenObject(0, offset: offset0)
		let myOffset =  try! builder.closeObject()
		if builder.config.uniqueTables {
			builder.cache[ObjectIdentifier(self)] = myOffset
		}
		return myOffset
	}
}
public final class EmailAddress {
	public var mailto : String? = nil
	public init(){}
	public init(mailto: String?){
		self.mailto = mailto
	}
}
public extension EmailAddress {
	private static func create(reader : FlatBufferReader, objectOffset : Offset?) -> EmailAddress? {
		guard let objectOffset = objectOffset else {
			return nil
		}
		if reader.config.uniqueTables {
			if let o = reader.objectPool[objectOffset]{
				return o as? EmailAddress
			}
		}
		let _result = EmailAddress()
		if reader.config.uniqueTables {
			reader.objectPool[objectOffset] = _result
		}
		_result.mailto = reader.getString(reader.getOffset(objectOffset, propertyIndex: 0))
		return _result
	}
}
public extension EmailAddress {
	public final class LazyAccess : Hashable {
		private let _reader : FlatBufferReader!
		private let _objectOffset : Offset!
		private init?(reader : FlatBufferReader, objectOffset : Offset?){
			guard let objectOffset = objectOffset else {
				_reader = nil
				_objectOffset = nil
				return nil
			}
			_reader = reader
			_objectOffset = objectOffset
		}

		public lazy var mailto : String? = self._reader.getString(self._reader.getOffset(self._objectOffset, propertyIndex: 0))

		public var createEagerVersion : EmailAddress? { return EmailAddress.create(_reader, objectOffset: _objectOffset) }
		
		public var hashValue: Int { return Int(_objectOffset) }
	}
}

public func ==(t1 : EmailAddress.LazyAccess, t2 : EmailAddress.LazyAccess) -> Bool {
	return t1._objectOffset == t2._objectOffset && t1._reader === t2._reader
}

public extension EmailAddress {
	private func addToByteArray(builder : FlatBufferBuilder) -> Offset {
		if builder.config.uniqueTables {
			if let myOffset = builder.cache[ObjectIdentifier(self)] {
				return myOffset
			}
		}
		let offset0 = try! builder.createString(mailto)
		try! builder.openObject(1)
		try! builder.addPropertyOffsetToOpenObject(0, offset: offset0)
		let myOffset =  try! builder.closeObject()
		if builder.config.uniqueTables {
			builder.cache[ObjectIdentifier(self)] = myOffset
		}
		return myOffset
	}
}
public final class WebAddress {
	public var url : String? = nil
	public init(){}
	public init(url: String?){
		self.url = url
	}
}
public extension WebAddress {
	private static func create(reader : FlatBufferReader, objectOffset : Offset?) -> WebAddress? {
		guard let objectOffset = objectOffset else {
			return nil
		}
		if reader.config.uniqueTables {
			if let o = reader.objectPool[objectOffset]{
				return o as? WebAddress
			}
		}
		let _result = WebAddress()
		if reader.config.uniqueTables {
			reader.objectPool[objectOffset] = _result
		}
		_result.url = reader.getString(reader.getOffset(objectOffset, propertyIndex: 0))
		return _result
	}
}
public extension WebAddress {
	public final class LazyAccess : Hashable {
		private let _reader : FlatBufferReader!
		private let _objectOffset : Offset!
		private init?(reader : FlatBufferReader, objectOffset : Offset?){
			guard let objectOffset = objectOffset else {
				_reader = nil
				_objectOffset = nil
				return nil
			}
			_reader = reader
			_objectOffset = objectOffset
		}

		public lazy var url : String? = self._reader.getString(self._reader.getOffset(self._objectOffset, propertyIndex: 0))

		public var createEagerVersion : WebAddress? { return WebAddress.create(_reader, objectOffset: _objectOffset) }
		
		public var hashValue: Int { return Int(_objectOffset) }
	}
}

public func ==(t1 : WebAddress.LazyAccess, t2 : WebAddress.LazyAccess) -> Bool {
	return t1._objectOffset == t2._objectOffset && t1._reader === t2._reader
}

public extension WebAddress {
	private func addToByteArray(builder : FlatBufferBuilder) -> Offset {
		if builder.config.uniqueTables {
			if let myOffset = builder.cache[ObjectIdentifier(self)] {
				return myOffset
			}
		}
		let offset0 = try! builder.createString(url)
		try! builder.openObject(1)
		try! builder.addPropertyOffsetToOpenObject(0, offset: offset0)
		let myOffset =  try! builder.closeObject()
		if builder.config.uniqueTables {
			builder.cache[ObjectIdentifier(self)] = myOffset
		}
		return myOffset
	}
}
public final class TelephoneNumber {
	public var number : String? = nil
	public init(){}
	public init(number: String?){
		self.number = number
	}
}
public extension TelephoneNumber {
	private static func create(reader : FlatBufferReader, objectOffset : Offset?) -> TelephoneNumber? {
		guard let objectOffset = objectOffset else {
			return nil
		}
		if reader.config.uniqueTables {
			if let o = reader.objectPool[objectOffset]{
				return o as? TelephoneNumber
			}
		}
		let _result = TelephoneNumber()
		if reader.config.uniqueTables {
			reader.objectPool[objectOffset] = _result
		}
		_result.number = reader.getString(reader.getOffset(objectOffset, propertyIndex: 0))
		return _result
	}
}
public extension TelephoneNumber {
	public final class LazyAccess : Hashable {
		private let _reader : FlatBufferReader!
		private let _objectOffset : Offset!
		private init?(reader : FlatBufferReader, objectOffset : Offset?){
			guard let objectOffset = objectOffset else {
				_reader = nil
				_objectOffset = nil
				return nil
			}
			_reader = reader
			_objectOffset = objectOffset
		}

		public lazy var number : String? = self._reader.getString(self._reader.getOffset(self._objectOffset, propertyIndex: 0))

		public var createEagerVersion : TelephoneNumber? { return TelephoneNumber.create(_reader, objectOffset: _objectOffset) }
		
		public var hashValue: Int { return Int(_objectOffset) }
	}
}

public func ==(t1 : TelephoneNumber.LazyAccess, t2 : TelephoneNumber.LazyAccess) -> Bool {
	return t1._objectOffset == t2._objectOffset && t1._reader === t2._reader
}

public extension TelephoneNumber {
	private func addToByteArray(builder : FlatBufferBuilder) -> Offset {
		if builder.config.uniqueTables {
			if let myOffset = builder.cache[ObjectIdentifier(self)] {
				return myOffset
			}
		}
		let offset0 = try! builder.createString(number)
		try! builder.openObject(1)
		try! builder.addPropertyOffsetToOpenObject(0, offset: offset0)
		let myOffset =  try! builder.closeObject()
		if builder.config.uniqueTables {
			builder.cache[ObjectIdentifier(self)] = myOffset
		}
		return myOffset
	}
}
public protocol Address{}
public protocol Address_LazyAccess{}
extension PostalAddress : Address {}
extension PostalAddress.LazyAccess : Address_LazyAccess {}
extension EmailAddress : Address {}
extension EmailAddress.LazyAccess : Address_LazyAccess {}
extension WebAddress : Address {}
extension WebAddress.LazyAccess : Address_LazyAccess {}
extension TelephoneNumber : Address {}
extension TelephoneNumber.LazyAccess : Address_LazyAccess {}
private func create_Address(reader : FlatBufferReader, propertyIndex : Int, objectOffset : Offset?) -> Address? {
	guard let objectOffset = objectOffset else {
		return nil
	}
	let unionCase : Int8 = reader.get(objectOffset, propertyIndex: propertyIndex, defaultValue: 0)
	guard let caseObjectOffset : Offset = reader.getOffset(objectOffset, propertyIndex:propertyIndex + 1) else {
		return nil
	}
	switch unionCase {
	case 1 : return PostalAddress.create(reader, objectOffset: caseObjectOffset)
	case 2 : return EmailAddress.create(reader, objectOffset: caseObjectOffset)
	case 3 : return WebAddress.create(reader, objectOffset: caseObjectOffset)
	case 4 : return TelephoneNumber.create(reader, objectOffset: caseObjectOffset)
	default : return nil
	}
}
private func create_Address_LazyAccess(reader : FlatBufferReader, propertyIndex : Int, objectOffset : Offset?) -> Address_LazyAccess? {
	guard let objectOffset = objectOffset else {
		return nil
	}
	let unionCase : Int8 = reader.get(objectOffset, propertyIndex: propertyIndex, defaultValue: 0)
	guard let caseObjectOffset : Offset = reader.getOffset(objectOffset, propertyIndex:propertyIndex + 1) else {
		return nil
	}
	switch unionCase {
	case 1 : return PostalAddress.LazyAccess(reader: reader, objectOffset: caseObjectOffset)
	case 2 : return EmailAddress.LazyAccess(reader: reader, objectOffset: caseObjectOffset)
	case 3 : return WebAddress.LazyAccess(reader: reader, objectOffset: caseObjectOffset)
	case 4 : return TelephoneNumber.LazyAccess(reader: reader, objectOffset: caseObjectOffset)
	default : return nil
	}
}
private func unionCase_Address(union : Address?) -> Int8 {
	switch union {
	case is PostalAddress : return 1
	case is EmailAddress : return 2
	case is WebAddress : return 3
	case is TelephoneNumber : return 4
	default : return 0
	}
}
private func addToByteArray_Address(builder : FlatBufferBuilder, union : Address?) -> Offset {
	switch union {
	case let u as PostalAddress : return u.addToByteArray(builder)
	case let u as EmailAddress : return u.addToByteArray(builder)
	case let u as WebAddress : return u.addToByteArray(builder)
	case let u as TelephoneNumber : return u.addToByteArray(builder)
	default : return 0
	}
}
private func performLateBindings(builder : FlatBufferBuilder) {
	for binding in builder.deferedBindings {
		switch binding.object {
		case let object as ContactList: try! builder.replaceOffset(object.addToByteArray(builder), atCursor: binding.cursor)
		case let object as Contact: try! builder.replaceOffset(object.addToByteArray(builder), atCursor: binding.cursor)
		case let object as Date: try! builder.replaceOffset(object.addToByteArray(builder), atCursor: binding.cursor)
		case let object as AddressEntry: try! builder.replaceOffset(object.addToByteArray(builder), atCursor: binding.cursor)
		case let object as PostalAddress: try! builder.replaceOffset(object.addToByteArray(builder), atCursor: binding.cursor)
		case let object as EmailAddress: try! builder.replaceOffset(object.addToByteArray(builder), atCursor: binding.cursor)
		case let object as WebAddress: try! builder.replaceOffset(object.addToByteArray(builder), atCursor: binding.cursor)
		case let object as TelephoneNumber: try! builder.replaceOffset(object.addToByteArray(builder), atCursor: binding.cursor)
		default: continue
		}
	}
}
