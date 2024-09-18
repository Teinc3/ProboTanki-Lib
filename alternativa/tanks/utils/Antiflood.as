package alternativa.tanks.utils
{
   import alternativa.osgi.service.clientlog.IClientLog;
   
   public class Antiflood
   {
      [Inject]
      public static var clientLog:IClientLog;
      
      private static var domains:Vector.<String>;
      
      private static var minChars:int;
      
      private static var minWords:int;
      
      private static var bufferSize:int;
      
      private static const LOG_CHANNEL_NAME:String = "chat";
      
      private static const nonConsonantLetters:RegExp = /[^bpfvбпфвcgjkqsxzсцзкгхdtдтlлйmnмнrржшщч]/g;
      
      private static const g1:RegExp = /[bpfvбпфв]+/g;
      
      private static const g2:RegExp = /[cgjkqsxzсцзкгх]+/g;
      
      private static const g3:RegExp = /[dtдт]+/g;
      
      private static const g4:RegExp = /[lлй]+/g;
      
      private static const g5:RegExp = /[mnмн]+/g;
      
      private static const g6:RegExp = /[rр]+/g;
      
      private static const g7:RegExp = /[жшщч]+/g;
      
      private static var chatMessageCodes:Vector.<Array> = Vector.<Array>([]);
      
      public function Antiflood()
      {
         super();
      }
      
      public static function init(param1:Vector.<String>, param2:int, param3:int, param4:int) : void
      {
         Antiflood.domains = param1;
         Antiflood.minChars = param2;
         Antiflood.minWords = param3;
         Antiflood.bufferSize = param4;
         clientLog.log(LOG_CHANNEL_NAME,"init: minChars = %1  minWords = %2 bufferSize = %3",Antiflood.minChars,Antiflood.minWords,Antiflood.bufferSize);
      }
      
      private static function getSoundexKey(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc3_:String = param1.substr(0,1).toUpperCase();
         param1 = param1.substr(1).toLowerCase().replace(nonConsonantLetters,"");
         param1 = param1.replace(g1,"1").replace(g2,"2").replace(g3,"3").replace(g4,"4").replace(g5,"5").replace(g6,"6").replace(g7,"7");
         var _loc4_:int = 0;
         while(_loc4_ < 10)
         {
            _loc2_ = _loc4_.toString();
            param1 = param1.replace(RegExp(_loc2_ + "{2,}"),_loc2_);
            _loc4_++;
         }
         if(param1.length > 4)
         {
            param1 = param1.substr(0,4);
         }
         else
         {
            param1 += int(0).toFixed(4 - param1.length).substr(2);
         }
         return _loc3_ + param1;
      }
      
      public static function isNotFlood(param1:String) : Boolean
      {
         var _loc2_:Array = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Array = getMessageKeys(param1);
         if(param1.length < minChars && _loc5_.length < minWords)
         {
            return true;
         }
         if(Antiflood.getLettersIndex(param1) < 0.3 || Antiflood.getUniqueWordsIndex(_loc5_) < 0.59)
         {
            return false;
         }
         for each(_loc2_ in chatMessageCodes)
         {
            _loc3_ = Math.max(_loc5_.length,_loc2_.length) / Math.min(_loc5_.length,_loc2_.length);
            if(_loc3_ < 1.5)
            {
               _loc4_ = compareKeys(_loc5_,_loc2_);
               if(_loc4_ > 0.7)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public static function compareKeys(param1:Array, param2:Array) : Number
      {
         var _loc3_:Number = 0;
         var _loc4_:int = int(param1.indexOf(param2[0]));
         if(param1.length > 1 && _loc4_ > -1 && _loc4_ < param1.length / 2)
         {
            param1 = param1.slice(_loc4_);
         }
         var _loc5_:int = Math.min(param1.length,param2.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(param1[_loc6_] == param2[_loc6_])
            {
               _loc3_ += 1;
            }
            else if(_loc6_ > 0 && param1[_loc6_] == param2[_loc6_ - 1])
            {
               _loc3_ += 0.5;
            }
            else if(_loc6_ < _loc5_ - 1 && param1[_loc6_] == param2[_loc6_ + 1])
            {
               _loc3_ += 0.5;
            }
            _loc6_++;
         }
         return _loc3_ / _loc5_;
      }
      
      public static function getMessageKeys(param1:String, param2:Boolean = false) : Array
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         param1 = cutAllowedSubstring(param1);
         var _loc6_:Array = param1.split(" ");
         var _loc7_:Array = new Array();
         for each(_loc3_ in _loc6_)
         {
            if(_loc3_ != "")
            {
               _loc7_.push(_loc3_);
            }
         }
         _loc4_ = [];
         for each(_loc5_ in _loc7_)
         {
            _loc4_.push(Antiflood.getSoundexKey(_loc5_));
         }
         if(param2 && _loc4_.length > 0 && (_loc7_.length >= minWords || param1.length >= minChars))
         {
            chatMessageCodes.push(_loc4_);
            if(chatMessageCodes.length > bufferSize)
            {
               chatMessageCodes.shift();
            }
         }
         return _loc4_;
      }
      
      private static function cutAllowedSubstring(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc3_:* = null;
         for each(_loc2_ in domains)
         {
            _loc3_ = "(http://|https://)?(www\\.)?" + _loc2_ + "[-a-zA-Z0-9./#%_]+";
            param1 = param1.replace(new RegExp(_loc3_,"gi")," ");
         }
         return param1.replace(/[\s_!@#$%^&*()"'\{\}_=+~,.;:\-\/?\[\]\/]+/g," ");
      }
      
      private static function getUniqueWordsIndex(param1:Array) : Number
      {
         var _loc2_:String = null;
         if(param1.length < 1)
         {
            return 1;
         }
         var _loc3_:Array = new Array();
         for each(_loc2_ in param1)
         {
            if(_loc3_.indexOf(_loc2_) < 0)
            {
               _loc3_.push(_loc2_);
            }
         }
         return _loc3_.length / param1.length;
      }
      
      public static function getLettersIndex(param1:String) : Number
      {
         var _loc2_:String = param1.replace(/[\s_!@#$%^&*()"'\{\}_=+~,.;:\-\/?\[\]\/]+/g,"");
         return _loc2_.length / param1.length;
      }
   }
}

