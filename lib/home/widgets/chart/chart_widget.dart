import 'package:flutter/material.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';

class ChartWiget extends StatefulWidget {
  final double score;

  ChartWiget({
    Key? key, 
    required this.score,
  }) : super(key: key);

  @override
  _ChartWigetState createState() => _ChartWigetState();
}

class _ChartWigetState extends State<ChartWiget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 0, end: widget.score).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context,_) => 
          Stack(children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: _animation.value,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ),
            Center(child: 
              Text("${(_animation.value * 100).toInt()}%", style: AppTextStyles.heading,)
            ),
          ],),
      ),
    );
  }
}