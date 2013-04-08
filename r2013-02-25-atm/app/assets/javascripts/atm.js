var checking = 1000;
var savings = 500;

$(function()
{
  $('#c_deposit').click(checking_deposit);
  $('#c_withdraw').click(checking_withdraw);
  $('#s_deposit').click(savings_deposit);
  $('#s_withdraw').click(savings_withdraw);
});

function checking_deposit()
{
  var amount = get_amount('checking')
  checking += amount;
  update_balance(checking, '#checking');
}

function checking_withdraw()
{
  var amount = get_amount('checking')

  if(amount <= checking)
  {
    checking -= amount;
  }
  else if(amount <= (checking + savings))
  {
    savings = (checking + savings) - amount;
    checking = 0;
  }

  update_balance(checking, '#checking');
  update_balance(savings, '#savings');
}

function savings_deposit()
{
  var amount = get_amount('savings')
  savings += amount;
  update_balance(savings, '#savings');
}

function savings_withdraw()
{
  var amount = get_amount('savings')

  if(amount <= savings)
  {
    savings -= amount;
    update_balance(savings, '#savings');
  }
}

function get_amount(account)
{
  var selector = (account == 'checking') ? '#c_amount' : '#s_amount';
  return parseInt($(selector).val());
}

function update_balance(amount, selector)
{
  $(selector).text('$' + amount);
  update_css(amount, selector);
  $('#c_amount').val('');
  $('#s_amount').val('');
}

function update_css(amount, selector)
{
  $(selector).removeClass('alert');

  if(amount == 0)
    $(selector).addClass('alert');
}
