package alternativa.tanks.utils.thirdparty
{
   public class URI
   {
      public static const URImustEscape:String = " %";
      
      public static const URIbaselineEscape:String = URImustEscape + ":?#/@";
      
      public static const URIpathEscape:String = URImustEscape + "?#";
      
      public static const URIqueryEscape:String = URImustEscape + "#";
      
      public static const URIqueryPartEscape:String = URImustEscape + "#&=";
      
      public static const URInonHierEscape:String = URImustEscape + "?#/";
      
      public static const UNKNOWN_SCHEME:String = "unknown";
      
      protected static const URIbaselineExcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URIbaselineEscape);
      
      protected static const URIschemeExcludedBitmap:URIEncodingBitmap = URIbaselineExcludedBitmap;
      
      protected static const URIuserpassExcludedBitmap:URIEncodingBitmap = URIbaselineExcludedBitmap;
      
      protected static const URIauthorityExcludedBitmap:URIEncodingBitmap = URIbaselineExcludedBitmap;
      
      protected static const URIportExludedBitmap:URIEncodingBitmap = URIbaselineExcludedBitmap;
      
      protected static const URIpathExcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URIpathEscape);
      
      protected static const URIqueryExcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URIqueryEscape);
      
      protected static const URIqueryPartExcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URIqueryPartEscape);
      
      protected static const URIfragmentExcludedBitmap:URIEncodingBitmap = URIqueryExcludedBitmap;
      
      protected static const URInonHierexcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URInonHierEscape);
      
      public static const NOT_RELATED:int = 0;
      
      public static const CHILD:int = 1;
      
      public static const EQUAL:int = 2;
      
      public static const PARENT:int = 3;
      
      protected static var _resolver:IURIResolver = null;
      
      protected var _valid:Boolean = false;
      
      protected var _relative:Boolean = false;
      
      protected var _scheme:String = "";
      
      protected var _authority:String = "";
      
      protected var _username:String = "";
      
      protected var _password:String = "";
      
      protected var _port:String = "";
      
      protected var _path:String = "";
      
      protected var _query:String = "";
      
      protected var _fragment:String = "";
      
      protected var _nonHierarchical:String = "";
      
      public function URI(param1:String = null)
      {
         super();
         if(param1 == null)
         {
            this.initialize();
         }
         else
         {
            this.constructURI(param1);
         }
      }
      
      public static function escapeChars(param1:String) : String
      {
         return fastEscapeChars(param1,URI.URIbaselineExcludedBitmap);
      }
      
      public static function unescapeChars(param1:String) : String
      {
         var _loc2_:String = null;
         return decodeURIComponent(param1);
      }
      
      public static function fastEscapeChars(param1:String, param2:URIEncodingBitmap) : String
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = "";
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc3_ = param1.charAt(_loc5_);
            _loc4_ = param2.ShouldEscape(_loc3_);
            if(_loc4_)
            {
               _loc3_ = _loc4_.toString(16);
               if(_loc3_.length == 1)
               {
                  _loc3_ = "0" + _loc3_;
               }
               _loc3_ = "%" + _loc3_;
               _loc3_ = _loc3_.toUpperCase();
            }
            _loc6_ += _loc3_;
            _loc5_++;
         }
         return _loc6_;
      }
      
      public static function queryPartEscape(param1:String) : String
      {
         var _loc2_:String = param1;
         return URI.fastEscapeChars(param1,URI.URIqueryPartExcludedBitmap);
      }
      
      public static function queryPartUnescape(param1:String) : String
      {
         var _loc2_:String = param1;
         return unescapeChars(_loc2_);
      }
      
      protected static function compareStr(param1:String, param2:String, param3:Boolean = true) : Boolean
      {
         if(param3 == false)
         {
            param1 = param1.toLowerCase();
            param2 = param2.toLowerCase();
         }
         return param1 == param2;
      }
      
      protected static function resolve(param1:URI) : URI
      {
         var _loc2_:URI = new URI();
         _loc2_.copyURI(param1);
         if(_resolver != null)
         {
            return _resolver.resolve(_loc2_);
         }
         return _loc2_;
      }
      
      public static function set resolver(param1:IURIResolver) : void
      {
         _resolver = param1;
      }
      
      public static function get resolver() : IURIResolver
      {
         return _resolver;
      }
      
      protected function constructURI(param1:String) : Boolean
      {
         if(!this.parseURI(param1))
         {
            this._valid = false;
         }
         return this.isValid();
      }
      
      protected function initialize() : void
      {
         this._valid = false;
         this._relative = false;
         this._scheme = UNKNOWN_SCHEME;
         this._authority = "";
         this._username = "";
         this._password = "";
         this._port = "";
         this._path = "";
         this._query = "";
         this._fragment = "";
         this._nonHierarchical = "";
      }
      
      protected function set hierState(param1:Boolean) : void
      {
         if(param1)
         {
            this._nonHierarchical = "";
            if(this._scheme == "" || this._scheme == UNKNOWN_SCHEME)
            {
               this._relative = true;
            }
            else
            {
               this._relative = false;
            }
            if(this._authority.length == 0 && this._path.length == 0)
            {
               this._valid = false;
            }
            else
            {
               this._valid = true;
            }
         }
         else
         {
            this._authority = "";
            this._username = "";
            this._password = "";
            this._port = "";
            this._path = "";
            this._relative = false;
            if(this._scheme == "" || this._scheme == UNKNOWN_SCHEME)
            {
               this._valid = false;
            }
            else
            {
               this._valid = true;
            }
         }
      }
      
      protected function get hierState() : Boolean
      {
         return this._nonHierarchical.length == 0;
      }
      
      protected function validateURI() : Boolean
      {
         if(this.isAbsolute())
         {
            if(this._scheme.length <= 1 || this._scheme == UNKNOWN_SCHEME)
            {
               return false;
            }
            if(this.verifyAlpha(this._scheme) == false)
            {
               return false;
            }
         }
         if(this.hierState)
         {
            if(this._path.search("\\") != -1)
            {
               return false;
            }
            if(this.isRelative() == false && this._scheme == UNKNOWN_SCHEME)
            {
               return false;
            }
         }
         else if(this._nonHierarchical.search("\\") != -1)
         {
            return false;
         }
         return true;
      }
      
      protected function parseURI(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = param1;
         this.initialize();
         _loc2_ = int(_loc4_.indexOf("#"));
         if(_loc2_ != -1)
         {
            if(_loc4_.length > _loc2_ + 1)
            {
               this._fragment = _loc4_.substr(_loc2_ + 1,_loc4_.length - (_loc2_ + 1));
            }
            _loc4_ = _loc4_.substr(0,_loc2_);
         }
         _loc2_ = int(_loc4_.indexOf("?"));
         if(_loc2_ != -1)
         {
            if(_loc4_.length > _loc2_ + 1)
            {
               this._query = _loc4_.substr(_loc2_ + 1,_loc4_.length - (_loc2_ + 1));
            }
            _loc4_ = _loc4_.substr(0,_loc2_);
         }
         _loc2_ = int(_loc4_.search(":"));
         _loc3_ = int(_loc4_.search("/"));
         var _loc5_:* = _loc2_ != -1;
         var _loc6_:* = _loc3_ != -1;
         var _loc7_:Boolean = !_loc6_ || _loc2_ < _loc3_;
         if(_loc5_ && _loc7_)
         {
            this._scheme = _loc4_.substr(0,_loc2_);
            this._scheme = this._scheme.toLowerCase();
            _loc4_ = _loc4_.substr(_loc2_ + 1);
            if(_loc4_.substr(0,2) != "//")
            {
               this._nonHierarchical = _loc4_;
               if((this._valid = this.validateURI()) == false)
               {
                  this.initialize();
               }
               return this.isValid();
            }
            this._nonHierarchical = "";
            _loc4_ = _loc4_.substr(2,_loc4_.length - 2);
         }
         else
         {
            this._scheme = "";
            this._relative = true;
            this._nonHierarchical = "";
         }
         if(this.isRelative())
         {
            this._authority = "";
            this._port = "";
            this._path = _loc4_;
         }
         else
         {
            if(_loc4_.substr(0,2) == "//")
            {
               while(_loc4_.charAt(0) == "/")
               {
                  _loc4_ = _loc4_.substr(1,_loc4_.length - 1);
               }
            }
            _loc2_ = int(_loc4_.search("/"));
            if(_loc2_ == -1)
            {
               this._authority = _loc4_;
               this._path = "";
            }
            else
            {
               this._authority = _loc4_.substr(0,_loc2_);
               this._path = _loc4_.substr(_loc2_,_loc4_.length - _loc2_);
            }
            _loc2_ = int(this._authority.search("@"));
            if(_loc2_ != -1)
            {
               this._username = this._authority.substr(0,_loc2_);
               this._authority = this._authority.substr(_loc2_ + 1);
               _loc2_ = int(this._username.search(":"));
               if(_loc2_ != -1)
               {
                  this._password = this._username.substring(_loc2_ + 1,this._username.length);
                  this._username = this._username.substr(0,_loc2_);
               }
               else
               {
                  this._password = "";
               }
            }
            else
            {
               this._username = "";
               this._password = "";
            }
            _loc2_ = int(this._authority.search(":"));
            if(_loc2_ != -1)
            {
               this._port = this._authority.substring(_loc2_ + 1,this._authority.length);
               this._authority = this._authority.substr(0,_loc2_);
            }
            else
            {
               this._port = "";
            }
            this._authority = this._authority.toLowerCase();
         }
         if((this._valid = this.validateURI()) == false)
         {
            this.initialize();
         }
         return this.isValid();
      }
      
      public function copyURI(param1:URI) : void
      {
         this._scheme = param1._scheme;
         this._authority = param1._authority;
         this._username = param1._username;
         this._password = param1._password;
         this._port = param1._port;
         this._path = param1._path;
         this._query = param1._query;
         this._fragment = param1._fragment;
         this._nonHierarchical = param1._nonHierarchical;
         this._valid = param1._valid;
         this._relative = param1._relative;
      }
      
      protected function verifyAlpha(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:RegExp = /[^a-z]/;
         param1 = param1.toLowerCase();
         _loc2_ = int(param1.search(_loc3_));
         if(_loc2_ == -1)
         {
            return true;
         }
         return false;
      }
      
      public function isValid() : Boolean
      {
         return this._valid;
      }
      
      public function isAbsolute() : Boolean
      {
         return !this._relative;
      }
      
      public function isRelative() : Boolean
      {
         return this._relative;
      }
      
      public function isDirectory() : Boolean
      {
         if(this._path.length == 0)
         {
            return false;
         }
         return this._path.charAt(this.path.length - 1) == "/";
      }
      
      public function isHierarchical() : Boolean
      {
         return this.hierState;
      }
      
      public function get scheme() : String
      {
         return URI.unescapeChars(this._scheme);
      }
      
      public function set scheme(param1:String) : void
      {
         var _loc2_:String = param1.toLowerCase();
         this._scheme = URI.fastEscapeChars(_loc2_,URI.URIschemeExcludedBitmap);
      }
      
      public function get authority() : String
      {
         return URI.unescapeChars(this._authority);
      }
      
      public function set authority(param1:String) : void
      {
         param1 = param1.toLowerCase();
         this._authority = URI.fastEscapeChars(param1,URI.URIauthorityExcludedBitmap);
         this.hierState = true;
      }
      
      public function get username() : String
      {
         return URI.unescapeChars(this._username);
      }
      
      public function set username(param1:String) : void
      {
         this._username = URI.fastEscapeChars(param1,URI.URIuserpassExcludedBitmap);
         this.hierState = true;
      }
      
      public function get password() : String
      {
         return URI.unescapeChars(this._password);
      }
      
      public function set password(param1:String) : void
      {
         this._password = URI.fastEscapeChars(param1,URI.URIuserpassExcludedBitmap);
         this.hierState = true;
      }
      
      public function get port() : String
      {
         return URI.unescapeChars(this._port);
      }
      
      public function set port(param1:String) : void
      {
         this._port = URI.escapeChars(param1);
         this.hierState = true;
      }
      
      public function get path() : String
      {
         return URI.unescapeChars(this._path);
      }
      
      public function set path(param1:String) : void
      {
         this._path = URI.fastEscapeChars(param1,URI.URIpathExcludedBitmap);
         if(this._scheme == UNKNOWN_SCHEME)
         {
            this._scheme = "";
         }
         this.hierState = true;
      }
      
      public function get query() : String
      {
         return URI.unescapeChars(this._query);
      }
      
      public function set query(param1:String) : void
      {
         this._query = URI.fastEscapeChars(param1,URI.URIqueryExcludedBitmap);
      }
      
      public function get queryRaw() : String
      {
         return this._query;
      }
      
      public function set queryRaw(param1:String) : void
      {
         this._query = param1;
      }
      
      public function get fragment() : String
      {
         return URI.unescapeChars(this._fragment);
      }
      
      public function set fragment(param1:String) : void
      {
         this._fragment = URI.fastEscapeChars(param1,URIfragmentExcludedBitmap);
      }
      
      public function get nonHierarchical() : String
      {
         return URI.unescapeChars(this._nonHierarchical);
      }
      
      public function set nonHierarchical(param1:String) : void
      {
         this._nonHierarchical = URI.fastEscapeChars(param1,URInonHierexcludedBitmap);
         this.hierState = false;
      }
      
      public function setParts(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String) : void
      {
         this.scheme = param1;
         this.authority = param2;
         this.port = param3;
         this.path = param4;
         this.query = param5;
         this.fragment = param6;
         this.hierState = true;
      }
      
      public function isOfType(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         return this._scheme == param1;
      }
      
      public function getQueryValue(param1:String) : String
      {
         var _loc2_:Object = null;
         var _loc3_:* = null;
         var _loc4_:String = null;
         _loc2_ = this.getQueryByMap();
         for(_loc3_ in _loc2_)
         {
            if(_loc3_ == param1)
            {
               return _loc2_[_loc3_];
            }
         }
         return new String("");
      }
      
      public function setQueryValue(param1:String, param2:String) : void
      {
         var _loc3_:Object = null;
         _loc3_ = this.getQueryByMap();
         _loc3_[param1] = param2;
         this.setQueryByMap(_loc3_);
      }
      
      public function getQueryByMap() : Object
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:Object = new Object();
         _loc1_ = this._query;
         _loc3_ = _loc1_.split("&");
         for each(_loc2_ in _loc3_)
         {
            if(_loc2_.length != 0)
            {
               _loc4_ = _loc2_.split("=");
               if(_loc4_.length > 0)
               {
                  _loc5_ = _loc4_[0];
                  if(_loc4_.length > 1)
                  {
                     _loc6_ = _loc4_[1];
                  }
                  else
                  {
                     _loc6_ = "";
                  }
                  _loc5_ = queryPartUnescape(_loc5_);
                  _loc6_ = queryPartUnescape(_loc6_);
                  _loc8_[_loc5_] = _loc6_;
               }
            }
         }
         return _loc8_;
      }
      
      public function setQueryByMap(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:* = null;
         var _loc4_:String = null;
         var _loc5_:* = null;
         var _loc6_:String = null;
         var _loc7_:* = "";
         for(_loc3_ in param1)
         {
            _loc4_ = param1[_loc2_];
            if(_loc4_ == null)
            {
               _loc4_ = "";
            }
            _loc3_ = queryPartEscape(_loc3_);
            _loc4_ = queryPartEscape(_loc4_);
            _loc5_ = _loc3_;
            if(_loc4_.length > 0)
            {
               _loc5_ += "=";
               _loc5_ = _loc5_ += "=" + _loc4_;
            }
            if(_loc7_.length != 0)
            {
               _loc7_ += "&";
            }
            _loc7_ += _loc5_;
         }
         this._query = _loc7_;
      }
      
      public function toString() : String
      {
         if(this == null)
         {
            return "";
         }
         return this.toStringInternal(false);
      }
      
      public function toDisplayString() : String
      {
         return this.toStringInternal(true);
      }
      
      protected function toStringInternal(param1:Boolean) : String
      {
         var _loc2_:* = "";
         var _loc3_:String = "";
         if(this.isHierarchical() == false)
         {
            _loc2_ += param1 ? this.scheme : this._scheme;
            _loc2_ += ":";
            _loc2_ += param1 ? this.nonHierarchical : this._nonHierarchical;
         }
         else
         {
            if(this.isRelative() == false)
            {
               if(this._scheme.length != 0)
               {
                  _loc3_ = param1 ? this.scheme : this._scheme;
                  _loc2_ += _loc3_ + ":";
               }
               if(this._authority.length != 0 || this.isOfType("file"))
               {
                  _loc2_ += "//";
                  if(this._username.length != 0)
                  {
                     _loc3_ = param1 ? this.username : this._username;
                     _loc2_ += _loc3_;
                     if(this._password.length != 0)
                     {
                        _loc3_ = param1 ? this.password : this._password;
                        _loc2_ += ":" + _loc3_;
                     }
                     _loc2_ += "@";
                  }
                  _loc3_ = param1 ? this.authority : this._authority;
                  _loc2_ += _loc3_;
                  if(this.port.length != 0)
                  {
                     _loc2_ += ":" + this.port;
                  }
               }
            }
            _loc3_ = param1 ? this.path : this._path;
            _loc2_ += _loc3_;
         }
         if(this._query.length != 0)
         {
            _loc3_ = param1 ? this.query : this._query;
            _loc2_ += "?" + _loc3_;
         }
         if(this.fragment.length != 0)
         {
            _loc3_ = param1 ? this.fragment : this._fragment;
            _loc2_ += "#" + _loc3_;
         }
         return _loc2_;
      }
      
      public function forceEscape() : void
      {
         this.scheme = this.scheme;
         this.setQueryByMap(this.getQueryByMap());
         this.fragment = this.fragment;
         if(this.isHierarchical())
         {
            this.authority = this.authority;
            this.path = this.path;
            this.port = this.port;
            this.username = this.username;
            this.password = this.password;
         }
         else
         {
            this.nonHierarchical = this.nonHierarchical;
         }
      }
      
      public function isOfFileType(param1:String) : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         _loc3_ = int(param1.lastIndexOf("."));
         if(_loc3_ != -1)
         {
            param1 = param1.substr(_loc3_ + 1);
         }
         _loc2_ = this.getExtension(true);
         if(_loc2_ == "")
         {
            return false;
         }
         if(compareStr(_loc2_,param1,false) == 0)
         {
            return true;
         }
         return false;
      }
      
      public function getExtension(param1:Boolean = false) : String
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:String = this.getFilename();
         if(_loc4_ == "")
         {
            return String("");
         }
         _loc3_ = int(_loc4_.lastIndexOf("."));
         if(_loc3_ == -1 || _loc3_ == 0)
         {
            return String("");
         }
         _loc2_ = _loc4_.substr(_loc3_);
         if(param1 && _loc2_.charAt(0) == ".")
         {
            _loc2_ = _loc2_.substr(1);
         }
         return _loc2_;
      }
      
      public function getFilename(param1:Boolean = false) : String
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         if(this.isDirectory())
         {
            return String("");
         }
         var _loc4_:String = this.path;
         _loc3_ = int(_loc4_.lastIndexOf("/"));
         if(_loc3_ != -1)
         {
            _loc2_ = _loc4_.substr(_loc3_ + 1);
         }
         else
         {
            _loc2_ = _loc4_;
         }
         if(param1)
         {
            _loc3_ = int(_loc2_.lastIndexOf("."));
            if(_loc3_ != -1)
            {
               _loc2_ = _loc2_.substr(0,_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function getDefaultPort() : String
      {
         if(this._scheme == "http")
         {
            return String("80");
         }
         if(this._scheme == "ftp")
         {
            return String("21");
         }
         if(this._scheme == "file")
         {
            return String("");
         }
         if(this._scheme == "sftp")
         {
            return String("22");
         }
         return String("");
      }
      
      public function getRelation(param1:URI, param2:Boolean = true) : int
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:URI = URI.resolve(this);
         var _loc9_:URI = URI.resolve(param1);
         if(_loc8_.isRelative() || _loc9_.isRelative())
         {
            return URI.NOT_RELATED;
         }
         if(_loc8_.isHierarchical() == false || _loc9_.isHierarchical() == false)
         {
            if(_loc8_.isHierarchical() == false && _loc9_.isHierarchical() == true || _loc8_.isHierarchical() == true && _loc9_.isHierarchical() == false)
            {
               return URI.NOT_RELATED;
            }
            if(_loc8_.scheme != _loc9_.scheme)
            {
               return URI.NOT_RELATED;
            }
            if(_loc8_.nonHierarchical != _loc9_.nonHierarchical)
            {
               return URI.NOT_RELATED;
            }
            return URI.EQUAL;
         }
         if(_loc8_.scheme != _loc9_.scheme)
         {
            return URI.NOT_RELATED;
         }
         if(_loc8_.authority != _loc9_.authority)
         {
            return URI.NOT_RELATED;
         }
         var _loc10_:String = _loc8_.port;
         var _loc11_:String = _loc9_.port;
         if(_loc10_ == "")
         {
            _loc10_ = _loc8_.getDefaultPort();
         }
         if(_loc11_ == "")
         {
            _loc11_ = _loc9_.getDefaultPort();
         }
         if(_loc10_ != _loc11_)
         {
            return URI.NOT_RELATED;
         }
         if(compareStr(_loc8_.path,_loc9_.path,param2))
         {
            return URI.EQUAL;
         }
         var _loc12_:String = _loc8_.path;
         var _loc13_:String = _loc9_.path;
         if((_loc12_ == "/" || _loc13_ == "/") && (_loc12_ == "" || _loc13_ == ""))
         {
            return URI.EQUAL;
         }
         _loc3_ = _loc12_.split("/");
         _loc4_ = _loc13_.split("/");
         if(_loc3_.length > _loc4_.length)
         {
            _loc6_ = _loc4_[_loc4_.length - 1];
            if(_loc6_.length > 0)
            {
               return URI.NOT_RELATED;
            }
            _loc4_.pop();
            _loc7_ = 0;
            while(_loc7_ < _loc4_.length)
            {
               _loc5_ = _loc3_[_loc7_];
               _loc6_ = _loc4_[_loc7_];
               if(compareStr(_loc5_,_loc6_,param2) == false)
               {
                  return URI.NOT_RELATED;
               }
               _loc7_++;
            }
            return URI.CHILD;
         }
         if(_loc3_.length < _loc4_.length)
         {
            _loc5_ = _loc3_[_loc3_.length - 1];
            if(_loc5_.length > 0)
            {
               return URI.NOT_RELATED;
            }
            _loc3_.pop();
            _loc7_ = 0;
            while(_loc7_ < _loc3_.length)
            {
               _loc5_ = _loc3_[_loc7_];
               _loc6_ = _loc4_[_loc7_];
               if(compareStr(_loc5_,_loc6_,param2) == false)
               {
                  return URI.NOT_RELATED;
               }
               _loc7_++;
            }
            return URI.PARENT;
         }
         return URI.NOT_RELATED;
      }
      
      public function getCommonParent(param1:URI, param2:Boolean = true) : URI
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:URI = URI.resolve(this);
         var _loc6_:URI = URI.resolve(param1);
         if(!_loc5_.isAbsolute() || !_loc6_.isAbsolute() || _loc5_.isHierarchical() == false || _loc6_.isHierarchical() == false)
         {
            return null;
         }
         var _loc7_:int = _loc5_.getRelation(_loc6_);
         if(_loc7_ == URI.NOT_RELATED)
         {
            return null;
         }
         _loc5_.chdir(".");
         _loc6_.chdir(".");
         while(_loc7_ = _loc5_.getRelation(_loc6_,param2), !(_loc7_ == URI.EQUAL || _loc7_ == URI.PARENT))
         {
            _loc3_ = _loc5_.toString();
            _loc5_.chdir("..");
            _loc4_ = _loc5_.toString();
            if(_loc3_ == _loc4_)
            {
               break;
            }
         }
         return _loc5_;
      }
      
      public function chdir(param1:String, param2:Boolean = false) : Boolean
      {
         var _loc3_:URI = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:String = param1;
         if(param2)
         {
            _loc11_ = URI.escapeChars(param1);
         }
         if(_loc11_ == "")
         {
            return true;
         }
         if(_loc11_.substr(0,2) == "//")
         {
            _loc10_ = this.scheme + ":" + _loc11_;
            return this.constructURI(_loc10_);
         }
         if(_loc11_.charAt(0) == "?")
         {
            _loc11_ = "./" + _loc11_;
         }
         _loc3_ = new URI(_loc11_);
         if(_loc3_.isAbsolute() || _loc3_.isHierarchical() == false)
         {
            this.copyURI(_loc3_);
            return true;
         }
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc15_:Boolean = false;
         var _loc16_:Boolean = false;
         _loc4_ = this.path;
         _loc5_ = _loc3_.path;
         if(_loc4_.length > 0)
         {
            _loc6_ = _loc4_.split("/");
         }
         else
         {
            _loc6_ = new Array();
         }
         if(_loc5_.length > 0)
         {
            _loc7_ = _loc5_.split("/");
         }
         else
         {
            _loc7_ = new Array();
         }
         if(_loc6_.length > 0 && _loc6_[0] == "")
         {
            _loc14_ = true;
            _loc6_.shift();
         }
         if(_loc6_.length > 0 && _loc6_[_loc6_.length - 1] == "")
         {
            _loc12_ = true;
            _loc6_.pop();
         }
         if(_loc7_.length > 0 && _loc7_[0] == "")
         {
            _loc15_ = true;
            _loc7_.shift();
         }
         if(_loc7_.length > 0 && _loc7_[_loc7_.length - 1] == "")
         {
            _loc13_ = true;
            _loc7_.pop();
         }
         if(_loc15_)
         {
            this.path = _loc3_.path;
            this.queryRaw = _loc3_.queryRaw;
            this.fragment = _loc3_.fragment;
            return true;
         }
         if(_loc7_.length == 0 && _loc3_.query == "")
         {
            this.fragment = _loc3_.fragment;
            return true;
         }
         if(_loc12_ == false && _loc6_.length > 0)
         {
            _loc6_.pop();
         }
         this.queryRaw = _loc3_.queryRaw;
         this.fragment = _loc3_.fragment;
         _loc6_ = _loc6_.concat(_loc7_);
         _loc9_ = 0;
         while(_loc9_ < _loc6_.length)
         {
            _loc8_ = _loc6_[_loc9_];
            _loc16_ = false;
            if(_loc8_ == ".")
            {
               _loc6_.splice(_loc9_,1);
               _loc9_--;
               _loc16_ = true;
            }
            else if(_loc8_ == "..")
            {
               if(_loc9_ >= 1)
               {
                  if(_loc6_[_loc9_ - 1] != "..")
                  {
                     _loc6_.splice(_loc9_ - 1,2);
                     _loc9_ -= 2;
                  }
               }
               else if(!this.isRelative())
               {
                  _loc6_.splice(_loc9_,1);
                  _loc9_--;
               }
               _loc16_ = true;
            }
            _loc9_++;
         }
         var _loc17_:String = "";
         _loc13_ ||= _loc16_;
         _loc17_ = this.joinPath(_loc6_,_loc14_,_loc13_);
         this.path = _loc17_;
         return true;
      }
      
      protected function joinPath(param1:Array, param2:Boolean, param3:Boolean) : String
      {
         var _loc4_:int = 0;
         var _loc5_:* = "";
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            if(_loc5_.length > 0)
            {
               _loc5_ += "/";
            }
            _loc5_ += param1[_loc4_];
            _loc4_++;
         }
         if(param3 && _loc5_.length > 0)
         {
            _loc5_ += "/";
         }
         if(param2)
         {
            _loc5_ = "/" + _loc5_;
         }
         return _loc5_;
      }
      
      public function makeAbsoluteURI(param1:URI) : Boolean
      {
         if(this.isAbsolute() || param1.isRelative())
         {
            return false;
         }
         var _loc2_:URI = new URI();
         _loc2_.copyURI(param1);
         if(_loc2_.chdir(this.toString()) == false)
         {
            return false;
         }
         this.copyURI(_loc2_);
         return true;
      }
      
      public function makeRelativeURI(param1:URI, param2:Boolean = true) : Boolean
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:URI = new URI();
         _loc9_.copyURI(param1);
         var _loc10_:Array = new Array();
         var _loc11_:String = this.path;
         var _loc12_:String = this.queryRaw;
         var _loc13_:String = this.fragment;
         var _loc14_:Boolean = false;
         var _loc15_:Boolean = false;
         if(this.isRelative())
         {
            return true;
         }
         if(_loc9_.isRelative())
         {
            return false;
         }
         if(this.isOfType(param1.scheme) == false || this.authority != param1.authority)
         {
            return false;
         }
         _loc15_ = this.isDirectory();
         _loc9_.chdir(".");
         _loc3_ = _loc11_.split("/");
         _loc4_ = _loc9_.path.split("/");
         if(_loc3_.length > 0 && _loc3_[0] == "")
         {
            _loc3_.shift();
         }
         if(_loc3_.length > 0 && _loc3_[_loc3_.length - 1] == "")
         {
            _loc15_ = true;
            _loc3_.pop();
         }
         if(_loc4_.length > 0 && _loc4_[0] == "")
         {
            _loc4_.shift();
         }
         if(_loc4_.length > 0 && _loc4_[_loc4_.length - 1] == "")
         {
            _loc4_.pop();
         }
         while(_loc4_.length > 0)
         {
            if(_loc3_.length == 0)
            {
               break;
            }
            _loc5_ = _loc3_[0];
            _loc6_ = _loc4_[0];
            if(!compareStr(_loc5_,_loc6_,param2))
            {
               break;
            }
            _loc3_.shift();
            _loc4_.shift();
         }
         var _loc16_:String = "..";
         _loc8_ = 0;
         while(_loc8_ < _loc4_.length)
         {
            _loc10_.push(_loc16_);
            _loc8_++;
         }
         _loc10_ = _loc10_.concat(_loc3_);
         _loc7_ = this.joinPath(_loc10_,false,_loc15_);
         if(_loc7_.length == 0)
         {
            _loc7_ = "./";
         }
         this.setParts("","","",_loc7_,_loc12_,_loc13_);
         return true;
      }
      
      public function unknownToURI(param1:String, param2:String = "http") : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(param1.length == 0)
         {
            this.initialize();
            return false;
         }
         param1 = param1.replace(/\\/g,"/");
         if(param1.length >= 2)
         {
            _loc3_ = param1.substr(0,2);
            if(_loc3_ == "//")
            {
               param1 = param2 + ":" + param1;
            }
         }
         if(param1.length >= 3)
         {
            _loc3_ = param1.substr(0,3);
            if(_loc3_ == "://")
            {
               param1 = param2 + param1;
            }
         }
         var _loc5_:URI = new URI(param1);
         if(_loc5_.isHierarchical() == false)
         {
            if(_loc5_.scheme == UNKNOWN_SCHEME)
            {
               this.initialize();
               return false;
            }
            this.copyURI(_loc5_);
            this.forceEscape();
            return true;
         }
         if(_loc5_.scheme != UNKNOWN_SCHEME && _loc5_.scheme.length > 0)
         {
            if(_loc5_.authority.length > 0 || _loc5_.scheme == "file")
            {
               this.copyURI(_loc5_);
               this.forceEscape();
               return true;
            }
            if(_loc5_.authority.length == 0 && _loc5_.path.length == 0)
            {
               this.setParts(_loc5_.scheme,"","","","","");
               return false;
            }
         }
         else
         {
            _loc4_ = _loc5_.path;
            if(_loc4_ == ".." || _loc4_ == "." || _loc4_.length >= 3 && _loc4_.substr(0,3) == "../" || _loc4_.length >= 2 && _loc4_.substr(0,2) == "./")
            {
               this.copyURI(_loc5_);
               this.forceEscape();
               return true;
            }
         }
         _loc5_ = new URI(param2 + "://" + param1);
         if(_loc5_.scheme.length > 0 && _loc5_.authority.length > 0)
         {
            this.copyURI(_loc5_);
            this.forceEscape();
            return true;
         }
         this.initialize();
         return false;
      }
   }
}

