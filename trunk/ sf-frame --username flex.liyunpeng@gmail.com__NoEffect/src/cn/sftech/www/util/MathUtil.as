package cn.sftech.www.util
{
	
	public class MathUtil {
		
		/**
		 * 返回指定2个数之间的随机数
		 * @param	s:Number 开始(包含)
		 * @param	e:Number 结束(不包含)
		 * @return	:Number
		 */
		public static function random(s:Number, e:Number):Number {
			var num:Number = Math.floor((e - s) * Math.random() + s);
			return num;
		}
	}
}