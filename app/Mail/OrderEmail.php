<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Database\Eloquent\Model;

class OrderEmail extends Mailable
{
    use Queueable, SerializesModels;

    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
       return  $this->from(env('MAIL_USERNAME'),env('APP_NAME'))
            ->subject("Поступил новый заказ")
            ->markdown('user.email.order.orderHTML')
            ->text('user.email.order.orderPlain')
            ->with([ 'order' => $this->model]);
    }
    protected $model;
}
