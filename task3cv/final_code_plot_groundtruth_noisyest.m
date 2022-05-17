plot(Std_dev_absolute_error,'xb')
%legend('standard deviation of estimated co-ordinates')
hold on
plot(Std_dev_absolute_error_Noisy,'g')
%egend('standard deviation of Noisy co-ordinates')
legend({'standard deviation of estimated co-ordinates','standard deviation of Noisy co-ordinates'}, 'Location', 'northwest')
hold off