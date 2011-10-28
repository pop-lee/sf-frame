package cn.sftech.www.effect.base
{
	import com.greensock.TweenLite;
	import com.greensock.data.TweenLiteVars;

	public class SFEffect
	{
		private var _target : Object;
		private var _duration : Number = 1;
		private var _vars : TweenLiteVars;
		
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
		
		public function get target() : Object
		{
			return _target;
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
		
		public function play() : void
		{
			TweenLite.to(_target,_duration,_vars);
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