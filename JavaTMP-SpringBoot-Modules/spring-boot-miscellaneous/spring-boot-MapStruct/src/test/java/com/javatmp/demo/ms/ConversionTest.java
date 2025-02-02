package com.javatmp.demo.ms;

import com.javatmp.demo.ms.simple.Source;
import com.javatmp.demo.ms.simple.SourceTargetMapper;
import com.javatmp.demo.ms.simple.Target;
import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.assertThat;

public class ConversionTest {

    @Test
    public void shouldApplyConversions() {
        Source source = new Source();
        source.setFoo(42);
        source.setBar(23L);
        source.setZip(73);

        Target target = SourceTargetMapper.INSTANCE.sourceToTarget(source);

        assertThat(target).isNotNull();
        assertThat(target.getFoo()).isEqualTo(42L);
        assertThat(target.getBar()).isEqualTo(23);
        assertThat(target.getZip()).isEqualTo("73");
    }

    @Test
    public void shouldHandleNulls() {
        Source source = new Source();
        Target target = SourceTargetMapper.INSTANCE.sourceToTarget(source);

        assertThat(target).isNotNull();
        assertThat(target.getFoo()).isEqualTo(0L);
        assertThat(target.getBar()).isEqualTo(0);
        assertThat(target.getZip()).isEqualTo("0");
    }

    @Test
    public void shouldApplyConversionsToMappedProperties() {
        Source source = new Source();
        source.setQax(42);
        source.setBaz(23L);

        Target target = SourceTargetMapper.INSTANCE.sourceToTarget(source);

        assertThat(target).isNotNull();
        assertThat(target.getBaz()).isEqualTo(42L);
        assertThat(target.getQax()).isEqualTo(23);
    }

    @Test
    public void shouldApplyConversionsForReverseMapping() {
        Target target = new Target();
        target.setFoo(42L);
        target.setBar(23);
        target.setZip("73");

        Source source = SourceTargetMapper.INSTANCE.targetToSource(target);

        assertThat(source).isNotNull();
        assertThat(source.getFoo()).isEqualTo(42);
        assertThat(source.getBar()).isEqualTo(23);
        assertThat(source.getZip()).isEqualTo(73);
    }

    @Test
    public void shouldApplyConversionsToMappedPropertiesForReverseMapping() {
        Target target = new Target();
        target.setQax(42);
        target.setBaz(23L);

        Source source = SourceTargetMapper.INSTANCE.targetToSource(target);

        assertThat(source).isNotNull();
        assertThat(source.getBaz()).isEqualTo(42);
        assertThat(source.getQax()).isEqualTo(23);
    }
}
