<?php


class DemoTest extends \Codeception\Test\Unit
{
    /**
     * @var \UnitTester
     */
    protected $tester;

    protected function _before()
    {
    }

    protected function _after()
    {
    }

    // tests
    public function testSomeFeature(UnitTester $I)
    {
        $a = 'asdasd';

        $I->assertEquals($a, 'asdasd');
    }
}