package cn.sftech.www.effect
{
	import cn.sftech.www.effect.base.SFEffect;
	
	public class SFMoveEffect extends SFEffect
	{
		private var _xTo : Number = 0;
		
		private var _xFrom : Number = 0;
		
		private var _yTo : Number = 0;
		
		private var _yFrom : Number = 0;
		
		public function SFMoveEffect()
		{
			super();
		}
		
		public function xTo(value : Number) : void
		{
			_xTo = value;
		}
		
		public function xFrom(value : Number) : void
		{
			_xFrom = value;
		}
		
		public function yTo(value : Number) : void
		{
			_yTo = value;
		}
		
		public function yFrom(value : Number) : void
		{
			_yFrom = value;
		}
		
	}
}