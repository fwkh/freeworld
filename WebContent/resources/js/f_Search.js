$(function()
{
	// 지역
    $('#area').mouseenter(function()
    {
        $('#areaList').show();
    });
    $('#area').mouseleave(function()
    {
    	$('#areaList').hide();
    });
    
    $('#areaList').mouseenter(function()
    {
    	$('#areaList').show();
    });
    $('#areaList').mouseleave(function()
    {
    	$('#areaList').hide();
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
    
    // 클릭 이벤트
    $('#areaList').each(function(i, e)
    {
    	$('.areaSelect').click(function()
		{
    		console.log($(this).text());
    		$('#searchWord').append($("<p id=ps"+ i + ">" + $(this).text() + "<a href='' class=del id=delSelect'>삭제</a>" + "</p>"));
    		i += 1;
		});
    });
    
    $('#skillList').each(function(i, e)
    {
	    $('.jobSelect').click(function()
		{
    		console.log($(this).text());
    		$('#searchWord').append($("<p id=ps"+ i + ">" + $(this).text() + "<a href='' class=del id=delSelect'>삭제</a>" + "</p>"));
    		i += 1;
		});
    });
    
    $('#careerList').each(function(i, e)
	{
		$('.setRangeValue').click(function()
		{
    		console.log($(this).text());
    		$('#searchWord').append($("<p id=ps"+ i + ">" + $(this).text() + "<a href='' class=del id=delSelect'>삭제</a>" + "</p>"));
    		i += 1;
		});
	});
    
    $('#delSelect').click(function()
    {
    	$('#ps1').remove();
    });
    
    // 검색
});