package cn.sftech.www.effect.base
{
	import com.greensock.TweenLite;
	import com.greensock.data.TweenLiteVars;

	public class SFEffect
	{
		private var _target : Object;
		private var _duration : Number = 1;
		private var _vars : TweenLiteVars;
		private var _isTo : Boolean = true;
		
		public function SFEffect()
		{
		}
		
		/**
		 * 设置需要缓动的对象
		 * @param target 缓动的对象引用
		 * 
		 */		
		public function set target(target : Object) : void
		{
			_target = target;
		}
		
		/**
		 * 设置缓动时间，单位为(秒)
		 * @param duration 缓动的时间
		 * 
		 */		
		public function set duration(duration : Number) : void
		{
			_duration = duration;
		}
		
		/**
		 * 设置缓动参数
		 * @param vars 缓动参数对象
		 * 
		 */		
		public function set vars(vars : TweenLiteVars) : void
		{
			_vars = vars;
		}
		
		/**
		 * 设置效果模式为To 或者是 From
		 * @param value 代表效果模式True为To，False为From
		 * 
		 */		
		public function set isTo(value : Boolean) : void
		{
			_isTo = value;
		}
		
		public function play() : void
		{
			if(_isTo) {
				TweenLite.to(_target,_duration,_vars);
			} else {
				TweenLite.from(_target,_duration,_vars);
			}
		}
		
		public function stop() : void
		{
			
		}
		
		public function set onComplete(func : Function) : void
		{
			_vars.onComplete(func);
		}
		
	}
}