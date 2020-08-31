$(function()
{
	// 지역
    $('#area').mouseenter(function()
    {
        $('#workAreaList').show();
    });
    $('#area').mouseleave(function()
    {
    	$('#workAreaList').hide();
    });
    
    $('#workAreaList').mouseenter(function()
    {
    	$('#workAreaList').show();
    });
    $('#workAreaList').mouseleave(function()
    {
    	$('#workAreaList').hide();
    });
    
    // 전문기술
    $('#skill').mouseenter(function()
    {
    	$('#skillList').show();
    });
    $('#skill').mouseleave(function()
    {
    	$('#skillList').hide();
    });
    
    $('#skillList').mouseenter(function()
    {
    	$('#skillList').show();
    });
    $('#skillList').mouseleave(function()
    {
    	$('#skillList').hide();
    });
    
    // 경력
    $('#careerDate').mouseenter(function()
	{
    	$('#careerList').show();
	});
    $('#careerDate').mouseleave(function()
    {
    	$('#careerList').hide();
    });
    
    $('#careerList').mouseenter(function()
    {
    	$('#careerList').show();
    });
    $('#careerList').mouseleave(function()
    {
    	$('#careerList').hide();
    });
    
    $('#areaSelect').click(function(){
    	console.log($('#area0').dataset.value);
    });
});